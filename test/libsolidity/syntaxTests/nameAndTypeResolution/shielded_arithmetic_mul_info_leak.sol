contract C {
    function f(suint256 a, suint256 b) internal pure returns (suint256) {
        return a * b;
    }
}
// ----
// Warning 10301: (102-107): Shielded integer multiplication can leak information. A revert due to overflow reveals range information about the operands.
