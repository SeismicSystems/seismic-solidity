// Division by zero is always checked, even in unchecked blocks,
// so the warning is still emitted.
contract C {
    function f(suint256 a, suint256 b) internal pure returns (suint256) {
        unchecked {
            return a / b;
        }
    }
}
// ----
// Warning 4281: (227-232): Shielded integer division can leak information. A revert due to division by zero reveals that the divisor is zero.
