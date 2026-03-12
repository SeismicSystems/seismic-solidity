contract C {
    suint256 private x;

    function testHexAssign() public returns (uint256) {
        x = 0xCAFEs;
        return uint(x);
    }

    function testHexArith() public returns (uint256) {
        x = 0xFFs + 1s;
        return uint(x);
    }

    function testHexBitwise() public returns (uint256) {
        x = 0xAAs | 0x55s;
        return uint(x);
    }

    function testHexUnderscore() public returns (uint256) {
        x = 0xDE_ADs;
        return uint(x);
    }
}
// ----
// testHexAssign() -> 0xCAFE
// testHexArith() -> 256
// testHexBitwise() -> 0xFF
// testHexUnderscore() -> 0xDEAD
