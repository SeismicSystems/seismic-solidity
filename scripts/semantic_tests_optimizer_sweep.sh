#!/usr/bin/env bash
set -euo pipefail

# --------------------------------------------------------------------------- #
# semantic_tests_optimizer_sweep.sh — run semantic tests across multiple
# optimizer-runs values, optionally with --via-ir.
# --------------------------------------------------------------------------- #

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SEMANTIC_TESTS_SCRIPT="$SCRIPT_DIR/semantic_tests.sh"

# Defaults
NUM_RUNS=5
RUN_ALL=0
MIN_RUNS=1
MAX_RUNS=200
WITH_VIA_IR=0
PASSTHROUGH_ARGS=()

function usage
{
	cat <<EOF
Usage: $(basename "$0") [options] [-- semantic_tests.sh options...]

Run semantic tests across multiple optimizer-runs values.

Options:
  -n N         Pick N random optimizer-runs values from the range (default: 5)
  --all        Run ALL values from min to max (overrides -n)
  --min M      Lower bound of the range (default: 1)
  --max M      Upper bound of the range (default: 200)
  --via-ir     Also test with --via-ir for each optimizer-runs value
  -h, --help   Show this help message

All other arguments are passed through to semantic_tests.sh
(e.g., -w, -s, -r, --stop-early, --solc, -t).
EOF
}

while [[ $# -gt 0 ]]; do
	case "$1" in
		-n)
			shift; NUM_RUNS="$1" ;;
		--all)
			RUN_ALL=1 ;;
		--min)
			shift; MIN_RUNS="$1" ;;
		--max)
			shift; MAX_RUNS="$1" ;;
		--via-ir)
			WITH_VIA_IR=1 ;;
		-h|--help)
			usage; exit 0 ;;
		*)
			PASSTHROUGH_ARGS+=("$1") ;;
	esac
	shift
done

# ---- Build list of optimizer-runs values ---- #

if [[ "$RUN_ALL" -eq 1 ]]; then
	RUNS_VALUES=()
	for (( i=MIN_RUNS; i<=MAX_RUNS; i++ )); do
		RUNS_VALUES+=("$i")
	done
else
	# Pick N random values from [MIN_RUNS, MAX_RUNS]
	RANGE=$((MAX_RUNS - MIN_RUNS + 1))
	if [[ "$NUM_RUNS" -ge "$RANGE" ]]; then
		# If N >= range size, just use all values
		RUNS_VALUES=()
		for (( i=MIN_RUNS; i<=MAX_RUNS; i++ )); do
			RUNS_VALUES+=("$i")
		done
	else
		RUNS_VALUES=()
		# Use shuf if available, otherwise fall back to $RANDOM
		if command -v shuf &>/dev/null; then
			while IFS= read -r val; do
				RUNS_VALUES+=("$val")
			done < <(seq "$MIN_RUNS" "$MAX_RUNS" | shuf -n "$NUM_RUNS" | sort -n)
		else
			# Fallback: generate random values with $RANDOM
			declare -A seen
			while [[ ${#RUNS_VALUES[@]} -lt $NUM_RUNS ]]; do
				val=$(( RANDOM % RANGE + MIN_RUNS ))
				if [[ -z "${seen[$val]:-}" ]]; then
					seen[$val]=1
					RUNS_VALUES+=("$val")
				fi
			done
			# Sort them
			IFS=$'\n' RUNS_VALUES=($(sort -n <<<"${RUNS_VALUES[*]}")); unset IFS
		fi
	fi
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
