#!/usr/bin/env bash
set -euo pipefail

# --------------------------------------------------------------------------- #
# semantic_tests_optimizer_sweep.sh — run semantic tests across multiple
# optimizer-runs values, optionally with --via-ir.
# --------------------------------------------------------------------------- #

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SEMANTIC_TESTS_SCRIPT="$SCRIPT_DIR/semantic_tests.sh"

# Defaults
WITH_VIA_IR=0
RUNS_VALUES=()
RANGE_MIN=""
RANGE_MAX=""
PASSTHROUGH_ARGS=()

# Common real-world optimizer-runs values:
#   1          — deploy-optimized (proxies, factories)
#   200        — Solidity default
#   1000       — moderate runtime optimization (DeFi protocols)
#   1000000    — heavy runtime optimization (Uniswap V3)
#   4294967295 — type(uint32).max, max optimization (Seaport/OpenSea)
PRESET_VALUES=(1 200 1000 1000000 4294967295)

function usage
{
	cat <<EOF
Usage: $(basename "$0") [options] [-- semantic_tests.sh options...]

Run semantic tests across multiple optimizer-runs values.

You must specify which values to test via --preset, --runs, or --range.

Options:
  --runs V1,V2,...  Comma-separated optimizer-runs values to test
  --preset          Use common real-world values: ${PRESET_VALUES[*]}
  --range N M       Test every integer from N to M (inclusive)
  --via-ir          Also test with --via-ir for each optimizer-runs value
  -h, --help        Show this help message

All other arguments are passed through to semantic_tests.sh
(e.g., -w, -s, -r, --stop-early, --solc, -t).

Examples:
  $(basename "$0") --preset
  $(basename "$0") --runs 1,200,10000
  $(basename "$0") --preset --via-ir
  $(basename "$0") --range 1 50
  $(basename "$0") --runs 500,1000 -w /path/to/workspace
EOF
}

while [[ $# -gt 0 ]]; do
	case "$1" in
		--runs)
			shift
			IFS=',' read -ra RUNS_VALUES <<< "$1" ;;
		--preset)
			RUNS_VALUES=("${PRESET_VALUES[@]}") ;;
		--range)
			shift; RANGE_MIN="$1"
			shift; RANGE_MAX="$1" ;;
		--via-ir)
			WITH_VIA_IR=1 ;;
		-h|--help)
			usage; exit 0 ;;
		*)
			PASSTHROUGH_ARGS+=("$1") ;;
	esac
	shift
done

# ---- Expand range if provided ---- #

if [[ -n "$RANGE_MIN" && -n "$RANGE_MAX" ]]; then
	for (( i=RANGE_MIN; i<=RANGE_MAX; i++ )); do
		RUNS_VALUES+=("$i")
	done
fi

# ---- Validate ---- #

if [[ ${#RUNS_VALUES[@]} -eq 0 ]]; then
	echo "Error: No optimizer-runs values specified." >&2
	echo "Use --preset for common values, --runs V1,V2,... for explicit values, or --range N M." >&2
	echo "Run with --help for usage info." >&2
	exit 1
fi

# ---- Build list of configurations ---- #

CONFIGS=()
for val in "${RUNS_VALUES[@]}"; do
	CONFIGS+=("optimize:${val}")
	if [[ "$WITH_VIA_IR" -eq 1 ]]; then
		CONFIGS+=("optimize:${val}:via-ir")
	fi
done

# ---- Print summary ---- #

echo "============================================================"
echo "Semantic test optimizer sweep"
echo "============================================================"
echo "Optimizer-runs values: ${RUNS_VALUES[*]}"
if [[ "$WITH_VIA_IR" -eq 1 ]]; then
	echo "Via-IR: yes (each value tested with and without --via-ir)"
else
	echo "Via-IR: no"
fi
echo "Total configurations: ${#CONFIGS[@]}"
echo "============================================================"
echo ""

# ---- Run each configuration ---- #

declare -A RESULTS
FAILED=0

for config in "${CONFIGS[@]}"; do
	IFS=':' read -r _ runs_val via_ir_flag <<< "$config"

	ARGS=(--optimizer-runs "$runs_val")
	LABEL="--optimizer-runs $runs_val"

	if [[ "$via_ir_flag" == "via-ir" ]]; then
		ARGS+=(--via-ir)
		LABEL="$LABEL --via-ir"
	fi

	echo ""
	echo "------------------------------------------------------------"
	echo "Running: $LABEL"
	echo "------------------------------------------------------------"

	if "$SEMANTIC_TESTS_SCRIPT" "${ARGS[@]}" "${PASSTHROUGH_ARGS[@]}"; then
		RESULTS["$config"]="PASS"
		echo ""
		echo ">>> PASS: $LABEL"
	else
		RESULTS["$config"]="FAIL"
		FAILED=1
		echo ""
		echo ">>> FAIL: $LABEL"
	fi
done

# ---- Summary ---- #

echo ""
echo "============================================================"
echo "Summary"
echo "============================================================"

for config in "${CONFIGS[@]}"; do
	IFS=':' read -r _ runs_val via_ir_flag <<< "$config"
	LABEL="--optimizer-runs $runs_val"
	if [[ "$via_ir_flag" == "via-ir" ]]; then
		LABEL="$LABEL --via-ir"
	fi
	printf "  %-40s %s\n" "$LABEL" "${RESULTS[$config]}"
done

echo "============================================================"

if [[ "$FAILED" -ne 0 ]]; then
	echo "Some configurations FAILED."
	exit 1
else
	echo "All configurations PASSED."
	exit 0
fi
