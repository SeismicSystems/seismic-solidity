contract C {
    function testAnd(sbool a, sbool b) public pure returns (bool) {
        return bool(a && b);
    }
    function testOr(sbool a, sbool b) public pure returns (bool) {
        return bool(a || b);
    }
    function testNot(sbool a) public pure returns (bool) {
        return bool(!a);
    }
}
// ----
// testAnd(sbool,sbool): true, true -> true
// testAnd(sbool,sbool): true, false -> false
// testAnd(sbool,sbool): false, true -> false
// testAnd(sbool,sbool): false, false -> false
// testOr(sbool,sbool): true, true -> true
// testOr(sbool,sbool): true, false -> true
// testOr(sbool,sbool): false, true -> true
// testOr(sbool,sbool): false, false -> false
// testNot(sbool): true -> false
// testNot(sbool): false -> true
