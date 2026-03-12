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
// Warning 9660: (148-151): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (212-214): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4282: (208-214): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9660: (232-234): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4282: (228-234): Shielded integer subtraction can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9660: (252-254): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4282: (248-254): Shielded integer multiplication can leak information. A revert due to overflow reveals range information about the operands.
// Warning 9660: (272-274): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4281: (268-274): Shielded integer division can leak information. A revert due to division by zero reveals that the divisor is zero.
// Warning 9660: (292-294): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 4281: (288-294): Shielded integer modulo can leak information. A revert due to division by zero reveals that the divisor is zero.
