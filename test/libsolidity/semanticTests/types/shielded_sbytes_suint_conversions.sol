// Verify sbytes N <-> suint(N*8) explicit conversions
contract C {
    function testSbytesToSuintA() public pure returns (bool) {
        // sbytes1 -> suint8
        sbytes1 sb1 = sbytes1(bytes1(0xAB));
        suint8 u8 = suint8(sb1);
        require(uint8(u8) == 0xAB);

        // sbytes2 -> suint16
        sbytes2 sb2 = sbytes2(bytes2(0xABCD));
        suint16 u16 = suint16(sb2);
        require(uint16(u16) == 0xABCD);

        // sbytes4 -> suint32
        sbytes4 sb4 = sbytes4(bytes4(0xDEADBEEF));
        suint32 u32 = suint32(sb4);
        require(uint32(u32) == 0xDEADBEEF);

        // sbytes8 -> suint64
        sbytes8 sb8 = sbytes8(bytes8(0x0102030405060708));
        suint64 u64 = suint64(sb8);
        require(uint64(u64) == 0x0102030405060708);

        return true;
    }

    function testSbytesToSuintB() public pure returns (bool) {
        // sbytes16 -> suint128
        sbytes16 sb16 = sbytes16(bytes16(0x0102030405060708090A0B0C0D0E0F10));
        suint128 u128 = suint128(sb16);
        require(uint128(u128) == 0x0102030405060708090A0B0C0D0E0F10);

        // sbytes32 -> suint256
        sbytes32 sb32 = sbytes32(bytes32(0x0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20));
        suint256 u256 = suint256(sb32);
        require(uint256(u256) == 0x0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20);

        return true;
    }

    function testSuintToSbytesA() public pure returns (bool) {
        // suint8 -> sbytes1
        suint8 u8 = suint8(0xAB);
        sbytes1 sb1 = sbytes1(u8);
        require(bytes1(sb1) == bytes1(0xAB));

        // suint16 -> sbytes2
        suint16 u16 = suint16(0xABCD);
        sbytes2 sb2 = sbytes2(u16);
        require(bytes2(sb2) == bytes2(0xABCD));

        // suint32 -> sbytes4
        suint32 u32 = suint32(0xDEADBEEF);
        sbytes4 sb4 = sbytes4(u32);
        require(bytes4(sb4) == bytes4(0xDEADBEEF));

        // suint64 -> sbytes8
        suint64 u64 = suint64(0x0102030405060708);
        sbytes8 sb8 = sbytes8(u64);
        require(bytes8(sb8) == bytes8(0x0102030405060708));

        return true;
    }

    function testSuintToSbytesB() public pure returns (bool) {
        // suint128 -> sbytes16
        suint128 u128 = suint128(0x0102030405060708090A0B0C0D0E0F10);
        sbytes16 sb16 = sbytes16(u128);
        require(bytes16(sb16) == bytes16(0x0102030405060708090A0B0C0D0E0F10));

        // suint256 -> sbytes32
        suint256 u256 = suint256(0x0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20);
        sbytes32 sb32 = sbytes32(u256);
        require(bytes32(sb32) == bytes32(0x0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20));

        return true;
    }

    function testRoundTripSbytesToSuint() public pure returns (bool) {
        // sbytes4 -> suint32 -> sbytes4
        sbytes4 orig = sbytes4(bytes4(0xDEADBEEF));
        suint32 mid = suint32(orig);
        sbytes4 back = sbytes4(mid);
        require(bytes4(back) == bytes4(0xDEADBEEF));

        // sbytes1 -> suint8 -> sbytes1
        sbytes1 orig1 = sbytes1(bytes1(0xFF));
        suint8 mid1 = suint8(orig1);
        sbytes1 back1 = sbytes1(mid1);
        require(bytes1(back1) == bytes1(0xFF));

        return true;
    }

    function testRoundTripSuintToSbytes() public pure returns (bool) {
        // suint32 -> sbytes4 -> suint32
        suint32 orig = suint32(0xCAFEBABE);
        sbytes4 mid = sbytes4(orig);
        suint32 back = suint32(mid);
        require(uint32(back) == 0xCAFEBABE);

        // suint256 -> sbytes32 -> suint256
        suint256 orig2 = suint256(42);
        sbytes32 mid2 = sbytes32(orig2);
        suint256 back2 = suint256(mid2);
        require(uint256(back2) == 42);

        return true;
    }

    function testEdgeValues() public pure returns (bool) {
        // Zero
        sbytes4 zero = sbytes4(bytes4(0x00000000));
        suint32 uZero = suint32(zero);
        require(uint32(uZero) == 0);

        // Max value
        sbytes4 maxVal = sbytes4(bytes4(0xFFFFFFFF));
        suint32 uMax = suint32(maxVal);
        require(uint32(uMax) == 0xFFFFFFFF);

        // sbytes1 max
        sbytes1 max1 = sbytes1(bytes1(0xFF));
        suint8 uMax1 = suint8(max1);
        require(uint8(uMax1) == 255);

        return true;
    }
}
// ----
// testSbytesToSuintA() -> true
// testSbytesToSuintB() -> true
// testSuintToSbytesA() -> true
// testSuintToSbytesB() -> true
// testRoundTripSbytesToSuint() -> true
// testRoundTripSuintToSbytes() -> true
// testEdgeValues() -> true
