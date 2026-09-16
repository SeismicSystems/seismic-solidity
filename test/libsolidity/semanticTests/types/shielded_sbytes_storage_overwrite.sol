// Verify storage overwrite correctly replaces previous value
contract C {
    sbytes1 private s1;
    sbytes8 private s8;
    sbytes32 private s32;
    sbytes4 private sA;
    sbytes4 private sB;

    function testOverwriteSmall() public returns (bool) {
        s1 = sbytes1(bytes1(0x01));
        require(bytes1(s1) == bytes1(0x01));

        s1 = sbytes1(bytes1(0xFF));
        require(bytes1(s1) == bytes1(0xFF));

        s1 = sbytes1(bytes1(0x00));
        require(bytes1(s1) == bytes1(0x00));

        return true;
    }

    function testOverwriteMedium() public returns (bool) {
        s8 = sbytes8(bytes8(0x0102030405060708));
        require(bytes8(s8) == bytes8(0x0102030405060708));

        s8 = sbytes8(bytes8(0x0000000000000000));
        require(bytes8(s8) == bytes8(0x0000000000000000));

        s8 = sbytes8(bytes8(0xFFFFFFFFFFFFFFFF));
        require(bytes8(s8) == bytes8(0xFFFFFFFFFFFFFFFF));

        return true;
    }

    function testOverwriteLarge() public returns (bool) {
        s32 = sbytes32(bytes32(0x0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20));
        require(bytes32(s32) == bytes32(0x0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20));

        s32 = sbytes32(bytes32(0));
        require(bytes32(s32) == bytes32(0));

        s32 = sbytes32(bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));
        require(bytes32(s32) == bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));

        return true;
    }

    function testSlotIsolation() public returns (bool) {
        // Write to sA, check sB is unaffected (and vice versa)
        sA = sbytes4(bytes4(0xAAAAAAAA));
        sB = sbytes4(bytes4(0xBBBBBBBB));

        require(bytes4(sA) == bytes4(0xAAAAAAAA));
        require(bytes4(sB) == bytes4(0xBBBBBBBB));

        // Overwrite sA, check sB unchanged
        sA = sbytes4(bytes4(0xCCCCCCCC));
        require(bytes4(sA) == bytes4(0xCCCCCCCC));
        require(bytes4(sB) == bytes4(0xBBBBBBBB));

        // Overwrite sB, check sA unchanged
        sB = sbytes4(bytes4(0xDDDDDDDD));
        require(bytes4(sA) == bytes4(0xCCCCCCCC));
        require(bytes4(sB) == bytes4(0xDDDDDDDD));

        return true;
    }
}
// ----
// testOverwriteSmall() -> true
// testOverwriteMedium() -> true
// testOverwriteLarge() -> true
// testSlotIsolation() -> true
