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
// Warning 9667: (152-155): Shielded number literals will leak during contract deployment.
// Warning 9667: (173-175): Shielded number literals will leak during contract deployment.
// Warning 10301: (169-175): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9667: (193-195): Shielded number literals will leak during contract deployment.
// Warning 10301: (189-195): Shielded integer multiplication can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9667: (210-212): Shielded number literals will leak during contract deployment.
// Warning 9667: (230-232): Shielded number literals will leak during contract deployment.
// Warning 10301: (226-232): Shielded integer subtraction can leak information. A revert due to overflow reveals range information about the operands.
