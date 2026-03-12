contract TestForSbool {
    function f(sbool condition, suint counter, suint limit) public pure returns (uint) {
        for (; condition; ) {
            counter++;
            if (counter == limit) {
                break;
            }
        }
        return uint(counter);
    }
}
// ----
// Warning 5765: (128-137): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10302: (155-164): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 5765: (182-198): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
