contract TestShieldedTernaryConditionSbytes {
    function f(sbytes4 a, sbytes4 b) public pure returns (uint) {
        return a > b ? 1 : 2;
    }
}
// ----
// Warning 5765: (127-132): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
