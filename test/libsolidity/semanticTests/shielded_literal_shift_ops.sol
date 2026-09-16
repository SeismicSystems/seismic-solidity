contract C {
    suint256 private x;

    function testLeftShift() public returns (uint256) {
        x = 1s << 8s;
        return uint(x);
    }

    function testRightShift() public returns (uint256) {
        x = 256s >> 4s;
        return uint(x);
    }

    function testShiftZero() public returns (uint256) {
        x = 42s << 0s;
        return uint(x);
    }

    function testLargeShift() public returns (uint256) {
        x = 1s << 255s;
        return uint(x);
    }
}
// ----
// testLeftShift() -> 256
// testRightShift() -> 16
// testShiftZero() -> 42
// testLargeShift() -> 0x8000000000000000000000000000000000000000000000000000000000000000
