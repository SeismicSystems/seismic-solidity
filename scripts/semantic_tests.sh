#!/usr/bin/env bash
set -euo pipefail

# --------------------------------------------------------------------------- #
# semantic_tests.sh — run Seismic semantic tests via revme (seismic-revm)
#
# Single-run mode (default):
#   ./semantic_tests.sh [--optimize] [--optimizer-runs N] [--via-ir] ...
#
# Sweep mode (triggered by --sweep-preset, --sweep-runs, or --sweep-range):
#   ./semantic_tests.sh --sweep-preset [--via-ir] ...
#   ./semantic_tests.sh --sweep-runs 1,200,10000 [--via-ir] ...
#   ./semantic_tests.sh --sweep-range 1 50 [--via-ir] ...
# --------------------------------------------------------------------------- #

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Defaults
SOLIDITY_ROOT=""
REVM_ROOT=""
WORKSPACE_ROOT=""
SOLC_BIN=""
TEST_DIR=""
OPTIMIZE=0
OPTIMIZER_RUNS=""
VIA_IR=0
KEEP_GOING=1
PASSTHROUGH_ARGS=()

# Sweep-mode variables
SWEEP_VALUES=()
SWEEP_RANGE_MIN=""
SWEEP_RANGE_MAX=""

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
Usage: $(basename "$0") [options] [-- extra-revme-args...]

Run Seismic semantic tests locally via revme from seismic-revm.

Path resolution (in priority order):
  -s <path>    Explicit seismic-solidity repo root
  -r <path>    Explicit seismic-revm repo root
  -w <path>    Workspace root (derives both repos as siblings)
  \$SEISMIC_WORKSPACE   Same as -w, lower priority
  Auto-detect  Infers solidity root from script location; looks for
               ../seismic-revm relative to the solidity root

Options:
  --optimize          Pass --optimize to revme
  --optimizer-runs N  Pass --optimizer-runs N (implies --optimize)
  --via-ir            Pass --via-ir (and --unsafe-via-ir) to revme
                      In sweep mode: test each value with AND without --via-ir
  --keep-going        Pass --keep-going to revme (default)
  --stop-early        Do NOT pass --keep-going
  -t <path>           Test directory (default: <solidity-root>/test/libsolidity/semanticTests)
  --solc <path>       Path to solc binary (default: <solidity-root>/build/solc/solc)
  -h, --help          Show this help message

Sweep mode (test across multiple optimizer-runs values):
  --sweep-preset          Use common real-world values: ${PRESET_VALUES[*]}
  --sweep-runs V1,V2,...  Comma-separated optimizer-runs values to test
  --sweep-range N M       Test every integer from N to M (inclusive)

Any unrecognized arguments are passed through to revme.
EOF
}

while [[ $# -gt 0 ]]; do
	case "$1" in
		-s)
			shift; SOLIDITY_ROOT="$1" ;;
		-r)
			shift; REVM_ROOT="$1" ;;
		-w)
			shift; WORKSPACE_ROOT="$1" ;;
		-t)
			shift; TEST_DIR="$1" ;;
		--solc)
			shift; SOLC_BIN="$1" ;;
		--optimize)
			OPTIMIZE=1 ;;
		--optimizer-runs)
			shift; OPTIMIZER_RUNS="$1"; OPTIMIZE=1 ;;
		--via-ir)
			VIA_IR=1 ;;
		--keep-going)
			KEEP_GOING=1 ;;
		--stop-early)
			KEEP_GOING=0 ;;
		--sweep-preset)
			SWEEP_VALUES=("${PRESET_VALUES[@]}") ;;
		--sweep-runs)
			shift; IFS=',' read -ra SWEEP_VALUES <<< "$1" ;;
		--sweep-range)
			shift; SWEEP_RANGE_MIN="$1"
			shift; SWEEP_RANGE_MAX="$1" ;;
		-h|--help)
			usage; exit 0 ;;
		*)
			PASSTHROUGH_ARGS+=("$1") ;;
	esac
	shift
done

# ---- Expand sweep range if provided ---- #

if [[ -n "$SWEEP_RANGE_MIN" && -n "$SWEEP_RANGE_MAX" ]]; then
	for (( i=SWEEP_RANGE_MIN; i<=SWEEP_RANGE_MAX; i++ )); do
		SWEEP_VALUES+=("$i")
	done
fi

# ---- Sweep mode: re-invoke self for each configuration ---- #

if [[ ${#SWEEP_VALUES[@]} -gt 0 ]]; then
	# Build list of configurations
	CONFIGS=()
	for val in "${SWEEP_VALUES[@]}"; do
		CONFIGS+=("optimize:${val}")
		if [[ "$VIA_IR" -eq 1 ]]; then
			CONFIGS+=("optimize:${val}:via-ir")
		fi
	done

	# Print summary
	echo "============================================================"
	echo "Semantic test optimizer sweep"
	echo "============================================================"
	echo "Optimizer-runs values: ${SWEEP_VALUES[*]}"
	if [[ "$VIA_IR" -eq 1 ]]; then
		echo "Via-IR: yes (each value tested with and without --via-ir)"
	else
		echo "Via-IR: no"
	fi
	echo "Total configurations: ${#CONFIGS[@]}"
	echo "============================================================"
	echo ""

	# Build common args to forward (path flags, keep-going, solc, test dir, passthrough)
	FORWARD_ARGS=()
	[[ -n "$SOLIDITY_ROOT" ]] && FORWARD_ARGS+=(-s "$SOLIDITY_ROOT")
	[[ -n "$REVM_ROOT" ]] && FORWARD_ARGS+=(-r "$REVM_ROOT")
	[[ -n "$WORKSPACE_ROOT" ]] && FORWARD_ARGS+=(-w "$WORKSPACE_ROOT")
	[[ -n "$SOLC_BIN" ]] && FORWARD_ARGS+=(--solc "$SOLC_BIN")
	[[ -n "$TEST_DIR" ]] && FORWARD_ARGS+=(-t "$TEST_DIR")
	[[ "$KEEP_GOING" -eq 0 ]] && FORWARD_ARGS+=(--stop-early)
	if [[ ${#PASSTHROUGH_ARGS[@]} -gt 0 ]]; then
		FORWARD_ARGS+=("${PASSTHROUGH_ARGS[@]}")
	fi

	# Run each configuration
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

		if "$0" "${ARGS[@]}" "${FORWARD_ARGS[@]}"; then
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

	# Summary
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
fi

# ---- Single-run mode: path resolution ---- #

# Solidity root: explicit > inferred from script location
if [[ -z "$SOLIDITY_ROOT" ]]; then
	SOLIDITY_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
fi
SOLIDITY_ROOT="$(cd "$SOLIDITY_ROOT" && pwd)"

# Revm root: explicit > workspace flag > env var > auto-detect
if [[ -z "$REVM_ROOT" ]]; then
	if [[ -n "$WORKSPACE_ROOT" ]]; then
		REVM_ROOT="$WORKSPACE_ROOT/seismic-revm"
	elif [[ -n "${SEISMIC_WORKSPACE:-}" ]]; then
		REVM_ROOT="$SEISMIC_WORKSPACE/seismic-revm"
	elif [[ -d "$SOLIDITY_ROOT/../seismic-revm" ]]; then
		REVM_ROOT="$(cd "$SOLIDITY_ROOT/../seismic-revm" && pwd)"
	else
		echo "Error: Cannot find seismic-revm." >&2
		echo "" >&2
		echo "Please specify its location using one of:" >&2
		echo "  -r <path>              Explicit path to seismic-revm repo" >&2
		echo "  -w <path>              Workspace root containing seismic-revm/" >&2
		echo "  SEISMIC_WORKSPACE=...  Environment variable pointing to workspace root" >&2
		echo "" >&2
		echo "The workspace layout should be:" >&2
		echo "  <workspace>/" >&2
		echo "    seismic-solidity/" >&2
		echo "    seismic-revm/" >&2
		exit 1
	fi
fi
REVM_ROOT="$(cd "$REVM_ROOT" && pwd)"

# Solc binary
if [[ -z "$SOLC_BIN" ]]; then
	SOLC_BIN="$SOLIDITY_ROOT/build/solc/solc"
fi

if [[ ! -x "$SOLC_BIN" ]]; then
	echo "Error: solc binary not found or not executable at: $SOLC_BIN" >&2
	echo "Build it first:  cd $SOLIDITY_ROOT/build && cmake .. && make -j\$(nproc) solc" >&2
	exit 1
fi

# Test directory
if [[ -z "$TEST_DIR" ]]; then
	TEST_DIR="$SOLIDITY_ROOT/test/libsolidity/semanticTests"
fi

# ---- Build revme command ---- #

REVME_ARGS=(semantics --unsafe-via-ir)

if [[ "$KEEP_GOING" -eq 1 ]]; then
	REVME_ARGS+=(--keep-going)
fi

if [[ "$OPTIMIZE" -eq 1 ]]; then
	REVME_ARGS+=(--optimize)
	if [[ -n "$OPTIMIZER_RUNS" ]]; then
		REVME_ARGS+=(--optimizer-runs "$OPTIMIZER_RUNS")
	fi
fi

if [[ "$VIA_IR" -eq 1 ]]; then
	REVME_ARGS+=(--via-ir)
fi

REVME_ARGS+=(-s "$SOLC_BIN" -t "$TEST_DIR")

if [[ ${#PASSTHROUGH_ARGS[@]} -gt 0 ]]; then
	REVME_ARGS+=("${PASSTHROUGH_ARGS[@]}")
fi

# ---- Run ---- #

echo ">>> cd $REVM_ROOT && cargo run -p revme -- ${REVME_ARGS[*]}"
cd "$REVM_ROOT"
exec cargo run -p revme -- "${REVME_ARGS[@]}"
