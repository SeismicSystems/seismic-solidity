// Verify shift-left (<<) and shift-right (>>) operations on sbytes
// Note: >>> (SHR) is disabled for FixedBytesType. Shift amounts must be uint.
contract C {
    function testShiftLeftSmall() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0x01));
        require(bytes1(a << 1) == bytes1(0x02));
        require(bytes1(a << 4) == bytes1(0x10));
        require(bytes1(a << 7) == bytes1(0x80));

        // Overflow: shifting 0x80 left by 1 loses the high bit
        sbytes1 b = sbytes1(bytes1(0x80));
        require(bytes1(b << 1) == bytes1(0x00));

        return true;
    }

    function testShiftLeftMedium() public pure returns (bool) {
        sbytes4 a = sbytes4(bytes4(0x00000001));
        require(bytes4(a << 8) == bytes4(0x00000100));
        require(bytes4(a << 16) == bytes4(0x00010000));
        require(bytes4(a << 24) == bytes4(0x01000000));

        // Overflow
        sbytes4 b = sbytes4(bytes4(0x01000000));
        require(bytes4(b << 8) == bytes4(0x00000000));

        return true;
    }

    function testShiftRightSmall() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0x80));
        require(bytes1(a >> 1) == bytes1(0x40));
        require(bytes1(a >> 7) == bytes1(0x01));

        // Shift out: 0x01 >> 1 loses the low bit
        sbytes1 b = sbytes1(bytes1(0x01));
        require(bytes1(b >> 1) == bytes1(0x00));

        return true;
    }

    function testShiftRightMedium() public pure returns (bool) {
        sbytes4 a = sbytes4(bytes4(0x01000000));
        require(bytes4(a >> 8) == bytes4(0x00010000));
        require(bytes4(a >> 16) == bytes4(0x00000100));
        require(bytes4(a >> 24) == bytes4(0x00000001));

        sbytes4 b = sbytes4(bytes4(0x00000001));
        require(bytes4(b >> 8) == bytes4(0x00000000));

        return true;
    }

    function testShiftByZero() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0xAB));
        require(bytes1(a << 0) == bytes1(0xAB));
        require(bytes1(a >> 0) == bytes1(0xAB));

        sbytes4 b = sbytes4(bytes4(0xDEADBEEF));
        require(bytes4(b << 0) == bytes4(0xDEADBEEF));
        require(bytes4(b >> 0) == bytes4(0xDEADBEEF));

        sbytes32 c = sbytes32(bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));
        require(bytes32(c << 0) == bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));
        require(bytes32(c >> 0) == bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));

        return true;
    }

    function testShiftByFullWidth() public pure returns (bool) {
        // Shifting by N*8 bits should zero out the value
        sbytes1 a = sbytes1(bytes1(0xFF));
        require(bytes1(a << 8) == bytes1(0x00));
        require(bytes1(a >> 8) == bytes1(0x00));

        sbytes4 b = sbytes4(bytes4(0xFFFFFFFF));
        require(bytes4(b << 32) == bytes4(0x00000000));
        require(bytes4(b >> 32) == bytes4(0x00000000));

        return true;
    }
}
// ----
// testShiftLeftSmall() -> true
// testShiftLeftMedium() -> true
// testShiftRightSmall() -> true
// testShiftRightMedium() -> true
// testShiftByZero() -> true
// testShiftByFullWidth() -> true
