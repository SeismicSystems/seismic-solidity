// Unchecked arithmetic does NOT produce the overflow warning because
// unchecked arithmetic doesn't revert on overflow.
contract C {
    function f(suint256 a, suint256 b) internal pure returns (suint256) {
        unchecked {
            return a + b;
        }
    }
}
// ----
