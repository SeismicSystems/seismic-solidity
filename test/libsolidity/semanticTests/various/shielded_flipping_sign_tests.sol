// Adapted from: test/libsolidity/semanticTests/various/flipping_sign_tests.sol
contract test {
    function f() public pure returns (bool) {
        sint256 x = sint256(int256(-2**255));
        unchecked { assert(int256(-x) == int256(x)); }
        return true;
    }
}
// ----
// f() -> true
