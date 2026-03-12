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
// Warning 10416: (81-84): Shielded number literals will leak during contract deployment.
// Warning 10416: (164-166): Shielded number literals will leak during contract deployment.
// Warning 10311: (160-166): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10416: (190-193): Shielded number literals will leak during contract deployment.
// Warning 10311: (185-193): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10416: (217-219): Shielded number literals will leak during contract deployment.
// Warning 10311: (212-219): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
