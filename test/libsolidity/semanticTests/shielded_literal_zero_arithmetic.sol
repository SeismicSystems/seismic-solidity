contract C {
    suint256 private x;

    function testAddZero() public returns (uint256) {
        x = 42s + 0s;
        return uint(x);
    }

    function testSubZero() public returns (uint256) {
        x = 42s - 0s;
        return uint(x);
    }

    function testMulZero() public returns (uint256) {
        x = 42s * 0s;
        return uint(x);
    }

    function testMulByOne() public returns (uint256) {
        x = 42s * 1s;
        return uint(x);
    }

    function testPowZero() public returns (uint256) {
        x = 42s ** 0s;
        return uint(x);
    }
}
// ----
// testAddZero() -> 42
// testSubZero() -> 42
// testMulZero() -> 0
// testMulByOne() -> 42
// testPowZero() -> 1
