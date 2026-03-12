contract C {
    suint256 private x;

    function test() internal {
        x = 10s;
        // Using shielded literals in if conditions (via comparison)
        if (x == 10s) {
            x = 20s;
        }
        if (x > 5s) {
            x = 0s;
        }
    }
}
// ----
// Warning 9667: (81-84): Shielded number literals will leak during contract deployment.
// Warning 9667: (172-175): Shielded number literals will leak during contract deployment.
// Warning 10311: (167-175): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9667: (195-198): Shielded number literals will leak during contract deployment.
// Warning 9667: (226-228): Shielded number literals will leak during contract deployment.
// Warning 10311: (222-228): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9667: (248-250): Shielded number literals will leak during contract deployment.
