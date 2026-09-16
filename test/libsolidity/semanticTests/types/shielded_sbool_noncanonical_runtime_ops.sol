contract C {
    function fromRaw(uint256 raw) internal pure returns (sbool v) {
        assembly {
            v := raw
        }
    }

    function testNot(uint256 raw) public pure returns (bool) {
        sbool v = fromRaw(raw);
        return bool(!v);
    }

    function testAnd(uint256 raw, sbool b) public pure returns (bool) {
        sbool v = fromRaw(raw);
        return bool(v && b);
    }

    function testOr(uint256 raw, sbool b) public pure returns (bool) {
        sbool v = fromRaw(raw);
        return bool(v || b);
    }

    function testEq(uint256 raw, sbool b) public pure returns (bool) {
        sbool v = fromRaw(raw);
        return bool(v == b);
    }

    function testNeq(uint256 raw, sbool b) public pure returns (bool) {
        sbool v = fromRaw(raw);
        return bool(v != b);
    }
}
// ----
// testNot(uint256): 0 -> true
// testNot(uint256): 5 -> false
// testAnd(uint256,sbool): 0, true -> false
// testAnd(uint256,sbool): 5, true -> true
// testOr(uint256,sbool): 0, false -> false
// testOr(uint256,sbool): 5, false -> true
// testEq(uint256,sbool): 0, false -> true
// testEq(uint256,sbool): 5, false -> false
// testNeq(uint256,sbool): 0, false -> false
// testNeq(uint256,sbool): 5, false -> true
