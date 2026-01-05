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
// Warning 9663: (182-198): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.

