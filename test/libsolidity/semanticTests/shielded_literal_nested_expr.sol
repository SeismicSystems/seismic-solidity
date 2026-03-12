contract C {
    suint256 private x;
    sint256 private y;

    function testNested1() public returns (uint256) {
        x = (1s + 2s) * 3s;
        return uint(x);
    }

    function testNested2() public returns (uint256) {
        x = 10s - (2s * 3s);
        return uint(x);
    }

    function testNested3() public returns (uint256) {
        x = (100s / 10s) + (50s % 7s);
        return uint(x);
    }

    function testSignedNested() public returns (int256) {
        y = (-10s + 5s) * 2s;
        return int(y);
    }
}
// ----
// testNested1() -> 9
// testNested2() -> 4
// testNested3() -> 11
// testSignedNested() -> -10
