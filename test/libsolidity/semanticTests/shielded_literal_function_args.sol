contract C {
    function add(suint256 a, suint256 b) internal pure returns (suint256) {
        return a + b;
    }

    function sub(sint256 a, sint256 b) internal pure returns (sint256) {
        return a - b;
    }

    function testAdd() public returns (uint256) {
        suint256 r = add(10s, 20s);
        return uint(r);
    }

    function testSub() public returns (int256) {
        sint256 r = sub(10s, 20s);
        return int(r);
    }

    function testNested() public returns (uint256) {
        suint256 r = add(add(1s, 2s), add(3s, 4s));
        return uint(r);
    }
}
// ----
// testAdd() -> 30
// testSub() -> -10
// testNested() -> 10
