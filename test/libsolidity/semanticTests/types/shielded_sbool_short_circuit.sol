contract C {
    uint256 calls;

    function mark(sbool v) internal returns (sbool) {
        calls++;
        return v;
    }

    function testOr(sbool a, sbool b) public returns (bool result, uint256 callCount) {
        calls = 0;
        sbool r = a || mark(b);
        return (bool(r), calls);
    }

    function testAnd(sbool a, sbool b) public returns (bool result, uint256 callCount) {
        calls = 0;
        sbool r = a && mark(b);
        return (bool(r), calls);
    }
}
// ----
// testOr(sbool,sbool): true, false -> true, 0
// testOr(sbool,sbool): false, false -> false, 1
// testOr(sbool,sbool): false, true -> true, 1
// testAnd(sbool,sbool): false, true -> false, 0
// testAnd(sbool,sbool): true, true -> true, 1
// testAnd(sbool,sbool): true, false -> false, 1
