contract C {
    suint256 private x;

    function test() internal {
        // Using shielded literals in for loop
        x = 0s;
        for (suint256 i = 0s; i < 10s; i = i + 1s) {
            x = x + i;
        }
    }
}
// ----
// Warning 9667: (128-130): Shielded number literals will leak during contract deployment.
// Warning 9667: (158-160): Shielded number literals will leak during contract deployment.
// Warning 9667: (166-169): Shielded number literals will leak during contract deployment.
// Warning 10311: (162-169): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9667: (179-181): Shielded number literals will leak during contract deployment.
// Warning 10301: (175-181): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10301: (201-206): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
