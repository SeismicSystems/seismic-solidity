// Verify edge/boundary values in sbytes storage
contract C {
    sbytes1 private s1;
    sbytes4 private s4;
    sbytes16 private s16;
    sbytes32 private s32;

    function testAllZeros() public returns (bool) {
        s1 = sbytes1(bytes1(0x00));
        require(bytes1(s1) == bytes1(0x00));

        s4 = sbytes4(bytes4(0x00000000));
        require(bytes4(s4) == bytes4(0x00000000));

        s16 = sbytes16(bytes16(0x00000000000000000000000000000000));
        require(bytes16(s16) == bytes16(0x00000000000000000000000000000000));

        s32 = sbytes32(bytes32(0));
        require(bytes32(s32) == bytes32(0));

        return true;
    }

    function testAllOnes() public returns (bool) {
        s1 = sbytes1(bytes1(0xFF));
        require(bytes1(s1) == bytes1(0xFF));

        s4 = sbytes4(bytes4(0xFFFFFFFF));
        require(bytes4(s4) == bytes4(0xFFFFFFFF));

        s16 = sbytes16(bytes16(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));
        require(bytes16(s16) == bytes16(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));

        s32 = sbytes32(bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));
        require(bytes32(s32) == bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));

        return true;
    }

    function testSingleBytePatternsSmall() public returns (bool) {
        // sbytes1 boundary values
        s1 = sbytes1(bytes1(0x01));
        require(bytes1(s1) == bytes1(0x01));

        s1 = sbytes1(bytes1(0x7F));
        require(bytes1(s1) == bytes1(0x7F));

        s1 = sbytes1(bytes1(0x80));
        require(bytes1(s1) == bytes1(0x80));

        s1 = sbytes1(bytes1(0xFE));
        require(bytes1(s1) == bytes1(0xFE));

        return true;
    }

    function testAlternatingPatterns() public returns (bool) {
        // Alternating bit patterns to catch masking bugs
        s4 = sbytes4(bytes4(0xAAAAAAAA));
        require(bytes4(s4) == bytes4(0xAAAAAAAA));

        s4 = sbytes4(bytes4(0x55555555));
        require(bytes4(s4) == bytes4(0x55555555));

        s32 = sbytes32(bytes32(0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA));
        require(bytes32(s32) == bytes32(0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA));

        s32 = sbytes32(bytes32(0x5555555555555555555555555555555555555555555555555555555555555555));
        require(bytes32(s32) == bytes32(0x5555555555555555555555555555555555555555555555555555555555555555));

        return true;
    }

    function testOnlyFirstByteSet() public returns (bool) {
        // For sbytes4: only first byte has value, rest zero
        s4 = sbytes4(bytes4(0xFF000000));
        require(bytes4(s4) == bytes4(0xFF000000));

        // Only last byte has value
        s4 = sbytes4(bytes4(0x000000FF));
        require(bytes4(s4) == bytes4(0x000000FF));

        // For sbytes32: only first byte set
        s32 = sbytes32(bytes32(0xFF00000000000000000000000000000000000000000000000000000000000000));
        require(bytes32(s32) == bytes32(0xFF00000000000000000000000000000000000000000000000000000000000000));

        // Only last byte set
        s32 = sbytes32(bytes32(0x00000000000000000000000000000000000000000000000000000000000000FF));
        require(bytes32(s32) == bytes32(0x00000000000000000000000000000000000000000000000000000000000000FF));

        return true;
    }
}
// ----
// testAllZeros() -> true
// testAllOnes() -> true
// testSingleBytePatternsSmall() -> true
// testAlternatingPatterns() -> true
// testOnlyFirstByteSet() -> true
