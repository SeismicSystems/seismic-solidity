contract C {
    function f(suint256 a, suint256 b) internal pure returns (suint256) {
        return a + b;
    }
}
// ----
// Warning 4282: (102-107): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
