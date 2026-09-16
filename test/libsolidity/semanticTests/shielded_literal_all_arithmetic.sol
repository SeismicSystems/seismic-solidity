// Comprehensive arithmetic test covering all operations with shielded literals
contract C {
    suint256 private x;

    function testAdd() public returns (uint256) {
        x = 100s + 200s;
        return uint(x);
    }

    function testSub() public returns (uint256) {
        x = 200s - 100s;
        return uint(x);
    }

    function testMul() public returns (uint256) {
        x = 100s * 200s;
        return uint(x);
    }

    function testDiv() public returns (uint256) {
        x = 200s / 100s;
        return uint(x);
    }

    function testMod() public returns (uint256) {
        x = 201s % 100s;
        return uint(x);
    }

    function testExp() public returns (uint256) {
        x = 3s ** 4s;
        return uint(x);
    }

    function testShiftLeft() public returns (uint256) {
        x = 1s << 10s;
        return uint(x);
    }

    function testShiftRight() public returns (uint256) {
        x = 1024s >> 5s;
        return uint(x);
    }

    function testBitAnd() public returns (uint256) {
        x = 0x0Cs & 0x0As;
        return uint(x);
    }

    function testBitOr() public returns (uint256) {
        x = 0x0Cs | 0x0As;
        return uint(x);
    }

    function testBitXor() public returns (uint256) {
        x = 0x0Cs ^ 0x0As;
        return uint(x);
    }
}
// ----
// testAdd() -> 300
// testSub() -> 100
// testMul() -> 20000
// testDiv() -> 2
// testMod() -> 1
// testExp() -> 81
// testShiftLeft() -> 1024
// testShiftRight() -> 32
// testBitAnd() -> 8
// testBitOr() -> 14
// testBitXor() -> 6
