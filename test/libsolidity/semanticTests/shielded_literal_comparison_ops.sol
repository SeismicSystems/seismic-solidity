contract C {
    function testEq() public pure returns (bool) {
        sbool r = (42s == 42s);
        return bool(r);
    }

    function testNeq() public pure returns (bool) {
        sbool r = (1s != 2s);
        return bool(r);
    }

    function testLt() public pure returns (bool) {
        sbool r = (1s < 2s);
        return bool(r);
    }

    function testGt() public pure returns (bool) {
        sbool r = (2s > 1s);
        return bool(r);
    }

    function testLte() public pure returns (bool) {
        sbool r = (1s <= 1s);
        return bool(r);
    }

    function testGte() public pure returns (bool) {
        sbool r = (2s >= 1s);
        return bool(r);
    }

    function testLtFalse() public pure returns (bool) {
        sbool r = (2s < 1s);
        return bool(r);
    }

    function testEqFalse() public pure returns (bool) {
        sbool r = (1s == 2s);
        return bool(r);
    }
}
// ----
// testEq() -> true
// testNeq() -> true
// testLt() -> true
// testGt() -> true
// testLte() -> true
// testGte() -> true
// testLtFalse() -> false
// testEqFalse() -> false
