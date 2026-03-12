contract C {
    suint256 private x;

    function test() internal {
        x = 10s;
        // Shielded literal in comparison used in require
        require(x > 5s);
        require(x == 10s);
        require(x != 0s);
    }
}
// ----
// Warning 9667: (81-84): Shielded number literals will leak during contract deployment.
// Warning 9667: (164-166): Shielded number literals will leak during contract deployment.
// Warning 5765: (160-166): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9667: (190-193): Shielded number literals will leak during contract deployment.
// Warning 5765: (185-193): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9667: (217-219): Shielded number literals will leak during contract deployment.
// Warning 5765: (212-219): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
