contract C {
    function f(sint256 a, sint256 b) internal pure returns (sint256) {
        sint256 sum = a + b;
        sint256 diff = a - b;
        sint256 prod = a * b;
        sint256 quot = a / b;
        sint256 rem = a % b;
        return sum + diff + prod + quot + rem;
    }
}
// ----
// Warning 10301: (106-111): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10301: (136-141): Shielded integer subtraction can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10301: (166-171): Shielded integer multiplication can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10303: (196-201): Shielded integer division can leak information. A revert due to division by zero reveals that the divisor is zero.
// Warning 10303: (225-230): Shielded integer modulo can leak information. A revert due to division by zero reveals that the divisor is zero.
// Warning 10301: (247-257): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10301: (247-264): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10301: (247-271): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 10301: (247-277): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
