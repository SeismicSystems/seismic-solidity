contract C {
    suint256 private x;
    sint256 private y;

    function test() internal {
        // Assignment with compound expressions
        x = 42s;
        x = x + 1s;
        x = x * 2s;
        y = -1s;
        y = y - 1s;
    }
}
// ----
// Warning 9660: (152-155): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (173-175): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4282: (169-175): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9660: (193-195): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4282: (189-195): Shielded integer multiplication can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9660: (210-212): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (230-232): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4282: (226-232): Shielded integer subtraction can leak information. A revert due to overflow reveals range information about the operands.
