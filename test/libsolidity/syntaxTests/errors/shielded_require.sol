contract TestSboolRequire {
    function f(sbool condition) public pure {
        require(condition, "Condition failed");
    }
}
// ----
// Warning 5765: (90-99): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
