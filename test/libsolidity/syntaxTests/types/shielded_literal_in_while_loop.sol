contract C {
    suint256 private x;
    suint256 private counter;

    function test() internal {
        counter = 0s;
        x = 0s;
        // Using shielded literals in while loop condition
        while (counter < 10s) {
            x = x + 1s;
            counter = counter + 1s;
        }
    }
}
// ----
// Warning 9667: (117-119): Shielded number literals will leak during contract deployment.
// Warning 9667: (133-135): Shielded number literals will leak during contract deployment.
// Warning 9667: (221-224): Shielded number literals will leak during contract deployment.
// Warning 5765: (211-224): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9667: (248-250): Shielded number literals will leak during contract deployment.
// Warning 10301: (244-250): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9667: (284-286): Shielded number literals will leak during contract deployment.
// Warning 10301: (274-286): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
