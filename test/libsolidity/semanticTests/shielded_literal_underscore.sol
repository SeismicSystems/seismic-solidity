contract C {
    suint256 private x;

    function testUnderscore() public returns (uint256) {
        x = 1_000s;
        return uint(x);
    }

    function testMultipleUnderscores() public returns (uint256) {
        x = 1_000_000_000s;
        return uint(x);
    }

    function testHexUnderscore() public returns (uint256) {
        x = 0xFF_FFs;
        return uint(x);
    }
}
// ----
// testUnderscore() -> 1000
// testMultipleUnderscores() -> 1000000000
// testHexUnderscore() -> 0xFFFF
