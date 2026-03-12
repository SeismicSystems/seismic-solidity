contract C {
    suint256 private x;

    function testAnd() public returns (uint256) {
        x = 0xFFs & 0x0Fs;
        return uint(x);
    }

    function testOr() public returns (uint256) {
        x = 0xF0s | 0x0Fs;
        return uint(x);
    }

    function testXor() public returns (uint256) {
        x = 0xFFs ^ 0x0Fs;
        return uint(x);
    }

    function testNot() public returns (uint256) {
        suint8 a = ~0s;
        return uint(uint8(a));
    }

    function testChained() public returns (uint256) {
        x = (0xFFs & 0xF0s) | 0x0Fs;
        return uint(x);
    }
}
// ----
// testAnd() -> 0x0f
// testOr() -> 0xff
// testXor() -> 0xf0
// testNot() -> 0xff
// testChained() -> 0xff
