contract TestShieldedForConditionSbytes {
    function f(sbytes4 a, sbytes4 b) public returns (uint) {
        uint i = 0;
        for (; a > b; ) {
            i++;
            if (i > 10) break;
        }
        return i;
    }
}
// ----
// Warning 5765: (138-143): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2018: (46-230): Function state mutability can be restricted to pure
