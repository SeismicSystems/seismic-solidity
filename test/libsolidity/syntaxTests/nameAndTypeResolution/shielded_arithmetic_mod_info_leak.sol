contract C {
    function f(suint256 a, suint256 b) internal pure returns (suint256) {
        return a % b;
    }
}
// ----
// Warning 10303: (102-107): Shielded integer modulo can leak information. A revert due to division by zero reveals that the divisor is zero.
