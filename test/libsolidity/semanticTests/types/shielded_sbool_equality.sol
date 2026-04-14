contract C {
    function testEq(sbool a, sbool b) public pure returns (bool) {
        return bool(a == b);
    }
    function testNeq(sbool a, sbool b) public pure returns (bool) {
        return bool(a != b);
    }
}
// ----
// testEq(sbool,sbool): true, true -> true
// testEq(sbool,sbool): true, false -> false
// testEq(sbool,sbool): false, true -> false
// testEq(sbool,sbool): false, false -> true
// testNeq(sbool,sbool): true, false -> true
// testNeq(sbool,sbool): false, true -> true
// testNeq(sbool,sbool): true, true -> false
// testNeq(sbool,sbool): false, false -> false
