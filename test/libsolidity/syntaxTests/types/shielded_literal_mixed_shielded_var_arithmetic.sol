// Test: shielded literal mixed with shielded variable should work
contract C {
    suint256 private x;

    function test() internal {
        x = 10s;
        // Shielded var + shielded literal
        x = x + 1s;
        x = x - 5s;
        x = x * 2s;
        x = x / 2s;
        x = x % 3s;
    }
}
// ----
// Warning 10416: (148-151): Shielded number literals will leak during contract deployment.
// Warning 10416: (212-214): Shielded number literals will leak during contract deployment.
// Warning 10301: (208-214): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10416: (232-234): Shielded number literals will leak during contract deployment.
// Warning 10301: (228-234): Shielded integer subtraction can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10416: (252-254): Shielded number literals will leak during contract deployment.
// Warning 10301: (248-254): Shielded integer multiplication can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10416: (272-274): Shielded number literals will leak during contract deployment.
// Warning 10303: (268-274): Shielded integer division can leak information. A revert due to division by zero reveals that the divisor is zero.
// Warning 10416: (292-294): Shielded number literals will leak during contract deployment.
// Warning 10303: (288-294): Shielded integer modulo can leak information. A revert due to division by zero reveals that the divisor is zero.
