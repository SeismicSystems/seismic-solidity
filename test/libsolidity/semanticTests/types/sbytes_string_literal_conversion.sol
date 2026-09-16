contract C {
    function testExplicitConversion() public pure returns (bool) {
        // Test explicit conversion from string literal to sbytes
        sbytes4 sb4 = sbytes4("abcd");
        require(sb4 == sbytes4(bytes4("abcd")));

        sbytes8 sb8 = sbytes8("abcdefgh");
        require(sb8 == sbytes8(bytes8("abcdefgh")));

        sbytes16 sb16 = sbytes16("abcdefghijklmnop");
        require(sb16 == sbytes16(bytes16("abcdefghijklmnop")));

        return true;
    }

    function testShortString() public pure returns (bool) {
        // String literal shorter than target type (should be left-aligned, zero-padded)
        sbytes4 sb4 = sbytes4("ab");
        require(sb4 == sbytes4(bytes4("ab")));

        sbytes8 sb8 = sbytes8("ab");
        require(sb8 == sbytes8(bytes8("ab")));

        return true;
    }

    function testHexLiteral() public pure returns (bool) {
        // Test explicit conversion from hex literal to sbytes
        sbytes4 sb4 = sbytes4(hex"61626364");
        require(sb4 == sbytes4(bytes4("abcd")));

        return true;
    }
}
// ----
// testExplicitConversion() -> true
// testShortString() -> true
// testHexLiteral() -> true
