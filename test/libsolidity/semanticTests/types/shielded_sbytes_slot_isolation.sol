// Verify multiple sbytes state variables don't interfere with each other or non-shielded vars
contract C {
    sbytes1 private sb1;
    sbytes2 private sb2;
    sbytes4 private sb4;
    sbytes8 private sb8;
    sbytes12 private sb12;
    sbytes16 private sb16;
    sbytes20 private sb20;
    sbytes32 private sb32;
    uint256 private plainUint;
    bytes32 private plainBytes;

    function testWriteAndVerifyAll() public returns (bool) {
        // Write unique values to each variable
        sb1 = sbytes1(bytes1(0x11));
        sb2 = sbytes2(bytes2(0x2222));
        sb4 = sbytes4(bytes4(0x44444444));
        sb8 = sbytes8(bytes8(0x8888888888888888));
        sb12 = sbytes12(bytes12(0xCCCCCCCCCCCCCCCCCCCCCCCC));
        sb16 = sbytes16(bytes16(0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA));
        sb20 = sbytes20(bytes20(0x0102030405060708091011121314151617181920));
        sb32 = sbytes32(bytes32(0xDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD));
        plainUint = 12345;
        plainBytes = bytes32(0xEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE);

        // Verify all values are correct
        require(bytes1(sb1) == bytes1(0x11));
        require(bytes2(sb2) == bytes2(0x2222));
        require(bytes4(sb4) == bytes4(0x44444444));
        require(bytes8(sb8) == bytes8(0x8888888888888888));
        require(bytes12(sb12) == bytes12(0xCCCCCCCCCCCCCCCCCCCCCCCC));
        require(bytes16(sb16) == bytes16(0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA));
        require(bytes20(sb20) == bytes20(0x0102030405060708091011121314151617181920));
        require(bytes32(sb32) == bytes32(0xDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD));
        require(plainUint == 12345);
        require(plainBytes == bytes32(0xEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE));

        return true;
    }

    function testOverwriteOneCheckOthers() public returns (bool) {
        // First set all values
        sb1 = sbytes1(bytes1(0x11));
        sb4 = sbytes4(bytes4(0x44444444));
        sb32 = sbytes32(bytes32(0xDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD));
        plainUint = 999;

        // Now overwrite only sb4
        sb4 = sbytes4(bytes4(0xFFFFFFFF));

        // Verify sb4 changed, others unchanged
        require(bytes4(sb4) == bytes4(0xFFFFFFFF));
        require(bytes1(sb1) == bytes1(0x11));
        require(bytes32(sb32) == bytes32(0xDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD));
        require(plainUint == 999);

        // Now overwrite sb32
        sb32 = sbytes32(bytes32(0));
        require(bytes32(sb32) == bytes32(0));
        require(bytes1(sb1) == bytes1(0x11));
        require(bytes4(sb4) == bytes4(0xFFFFFFFF));
        require(plainUint == 999);

        return true;
    }

    function testZeroDefaultValues() public returns (bool) {
        // Before any writes, all should be zero/default
        // Note: This test must be called on a fresh contract deployment
        require(bytes1(sb1) == bytes1(0x00));
        require(bytes2(sb2) == bytes2(0x0000));
        require(bytes4(sb4) == bytes4(0x00000000));
        require(plainUint == 0);
        require(plainBytes == bytes32(0));

        return true;
    }
}
// ----
// testZeroDefaultValues() -> true
// testWriteAndVerifyAll() -> true
// testOverwriteOneCheckOthers() -> true
