// Verify bitwise AND, OR, XOR, NOT produce correct results for sbytes
contract C {
    sbytes4 private stored;

    function testAnd() public pure returns (bool) {
        sbytes1 a1 = sbytes1(bytes1(0xFF));
        sbytes1 b1 = sbytes1(bytes1(0x0F));
        require(bytes1(a1 & b1) == bytes1(0x0F));

        sbytes4 a4 = sbytes4(bytes4(0xF0F0F0F0));
        sbytes4 b4 = sbytes4(bytes4(0x0F0F0F0F));
        require(bytes4(a4 & b4) == bytes4(0x00000000));

        sbytes8 a8 = sbytes8(bytes8(0xFF00FF00FF00FF00));
        sbytes8 b8 = sbytes8(bytes8(0xFFFF0000FFFF0000));
        require(bytes8(a8 & b8) == bytes8(0xFF000000FF000000));

        sbytes32 a32 = sbytes32(bytes32(0xFF00000000000000000000000000000000000000000000000000000000000000));
        sbytes32 b32 = sbytes32(bytes32(0xFFFF000000000000000000000000000000000000000000000000000000000000));
        require(bytes32(a32 & b32) == bytes32(0xFF00000000000000000000000000000000000000000000000000000000000000));

        return true;
    }

    function testOr() public pure returns (bool) {
        sbytes1 a1 = sbytes1(bytes1(0xF0));
        sbytes1 b1 = sbytes1(bytes1(0x0F));
        require(bytes1(a1 | b1) == bytes1(0xFF));

        sbytes4 a4 = sbytes4(bytes4(0xF0000000));
        sbytes4 b4 = sbytes4(bytes4(0x0F000000));
        require(bytes4(a4 | b4) == bytes4(0xFF000000));

        sbytes8 a8 = sbytes8(bytes8(0xFF00000000000000));
        sbytes8 b8 = sbytes8(bytes8(0x00FF000000000000));
        require(bytes8(a8 | b8) == bytes8(0xFFFF000000000000));

        return true;
    }

    function testXor() public pure returns (bool) {
        sbytes1 a1 = sbytes1(bytes1(0xFF));
        sbytes1 b1 = sbytes1(bytes1(0xFF));
        require(bytes1(a1 ^ b1) == bytes1(0x00));

        sbytes1 c1 = sbytes1(bytes1(0xAA));
        sbytes1 d1 = sbytes1(bytes1(0x55));
        require(bytes1(c1 ^ d1) == bytes1(0xFF));

        sbytes4 a4 = sbytes4(bytes4(0xAAAAAAAA));
        sbytes4 b4 = sbytes4(bytes4(0x55555555));
        require(bytes4(a4 ^ b4) == bytes4(0xFFFFFFFF));

        return true;
    }

    function testNot() public pure returns (bool) {
        sbytes1 a1 = sbytes1(bytes1(0x00));
        require(bytes1(~a1) == bytes1(0xFF));

        sbytes1 b1 = sbytes1(bytes1(0xFF));
        require(bytes1(~b1) == bytes1(0x00));

        sbytes1 c1 = sbytes1(bytes1(0xAA));
        require(bytes1(~c1) == bytes1(0x55));

        sbytes4 a4 = sbytes4(bytes4(0xF0F0F0F0));
        require(bytes4(~a4) == bytes4(0x0F0F0F0F));

        sbytes32 a32 = sbytes32(bytes32(0));
        require(bytes32(~a32) == bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));

        return true;
    }

    function testIdentities() public pure returns (bool) {
        sbytes8 a = sbytes8(bytes8(0xDEADBEEFCAFE1234));

        // a & a == a
        require(bytes8(a & a) == bytes8(a));

        // a | a == a
        require(bytes8(a | a) == bytes8(a));

        // a ^ a == 0
        require(bytes8(a ^ a) == bytes8(0));

        // ~~a == a
        require(bytes8(~~a) == bytes8(a));

        return true;
    }

    function testWithStorage() public returns (bool) {
        stored = sbytes4(bytes4(0xDEADBEEF));

        sbytes4 mask = sbytes4(bytes4(0xFF00FF00));
        sbytes4 result = stored & mask;
        require(bytes4(result) == bytes4(0xDE00BE00));

        result = stored | sbytes4(bytes4(0x00FF00FF));
        require(bytes4(result) == bytes4(0xDEFFBEFF));

        result = ~stored;
        require(bytes4(result) == bytes4(0x21524110));

        return true;
    }
}
// ----
// testAnd() -> true
// testOr() -> true
// testXor() -> true
// testNot() -> true
// testIdentities() -> true
// testWithStorage() -> true
