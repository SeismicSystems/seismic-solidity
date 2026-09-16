// Verify sbytes values passed through function parameters and returns
contract C {
    function _identity4(sbytes4 x) internal pure returns (sbytes4) {
        return x;
    }

    function _identity1(sbytes1 x) internal pure returns (sbytes1) {
        return x;
    }

    function _identity32(sbytes32 x) internal pure returns (sbytes32) {
        return x;
    }

    function _multiParam(sbytes1 a, sbytes8 b, sbytes32 c) internal pure returns (sbytes1, sbytes8, sbytes32) {
        return (a, b, c);
    }

    function testInternalCall() public pure returns (bool) {
        sbytes4 v = sbytes4(bytes4(0xDEADBEEF));
        sbytes4 result = _identity4(v);
        require(bytes4(result) == bytes4(0xDEADBEEF));

        sbytes1 v1 = sbytes1(bytes1(0xAB));
        require(bytes1(_identity1(v1)) == bytes1(0xAB));

        sbytes32 v32 = sbytes32(bytes32(0xCAFEBABE00000000000000000000000000000000000000000000000000000000));
        require(bytes32(_identity32(v32)) == bytes32(0xCAFEBABE00000000000000000000000000000000000000000000000000000000));

        return true;
    }

    function testMultipleParams() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0x42));
        sbytes8 b = sbytes8(bytes8(0x0102030405060708));
        sbytes32 c = sbytes32(bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));

        (sbytes1 ra, sbytes8 rb, sbytes32 rc) = _multiParam(a, b, c);

        require(bytes1(ra) == bytes1(0x42));
        require(bytes8(rb) == bytes8(0x0102030405060708));
        require(bytes32(rc) == bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));

        return true;
    }

    // External function for self-call (ABI encode/decode roundtrip)
    // Returns bytes4 since external functions cannot return shielded types
    function externalConvert(sbytes4 x) external pure returns (bytes4) {
        return bytes4(x);
    }

    function testExternalSelfCall() public returns (bool) {
        sbytes4 v = sbytes4(bytes4(0xCAFEBABE));
        bytes4 result = this.externalConvert(v);
        require(result == bytes4(0xCAFEBABE));

        return true;
    }

    function testPassZero() public pure returns (bool) {
        sbytes4 v = sbytes4(bytes4(0x00000000));
        require(bytes4(_identity4(v)) == bytes4(0x00000000));

        return true;
    }
}
// ----
// testInternalCall() -> true
// testMultipleParams() -> true
// testExternalSelfCall() -> true
// testPassZero() -> true
