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
// Warning 10311: (128-137): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10302: (155-164): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 10311: (182-198): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10313: (264-277): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
