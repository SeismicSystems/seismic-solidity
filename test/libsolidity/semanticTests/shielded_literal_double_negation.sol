contract C {
    sint256 private x;

    function testNeg() public returns (int256) {
        x = -42s;
        return int(x);
    }

    function testDoubleNeg() public returns (int256) {
        x = -(-42s);
        return int(x);
    }

    function testTripleNeg() public returns (int256) {
        x = -(-(-42s));
        return int(x);
    }
}
// ----
// testNeg() -> -42
// testDoubleNeg() -> 42
// testTripleNeg() -> -42
