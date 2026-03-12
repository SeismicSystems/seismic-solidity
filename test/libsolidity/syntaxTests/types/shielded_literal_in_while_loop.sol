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
// Warning 9660: (117-119): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (133-135): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (221-224): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 5765: (211-224): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9660: (248-250): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4282: (244-250): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9660: (284-286): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4282: (274-286): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
