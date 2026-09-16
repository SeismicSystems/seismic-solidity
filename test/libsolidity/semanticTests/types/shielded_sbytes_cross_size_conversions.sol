// Verify explicit conversions between different sbytes sizes
contract C {
    function testSmallToLarge() public pure returns (bool) {
        // Implicit conversion: smaller to larger sbytes (zero-padded on right)
        sbytes1 a = sbytes1(bytes1(0xAB));
        sbytes2 b = a;
        require(bytes2(b) == bytes2(0xAB00));

        sbytes4 c = a;
        require(bytes4(c) == bytes4(0xAB000000));

        sbytes8 d = a;
        require(bytes8(d) == bytes8(0xAB00000000000000));

        sbytes4 e = sbytes4(bytes4(0xDEADBEEF));
        sbytes8 f = e;
        require(bytes8(f) == bytes8(0xDEADBEEF00000000));

        sbytes16 g = e;
        require(bytes16(g) == bytes16(0xDEADBEEF000000000000000000000000));

        return true;
    }

    function testLargeToSmall() public pure returns (bool) {
        // Explicit conversion: larger to smaller sbytes (keeps left bytes, truncates right)
        sbytes4 a = sbytes4(bytes4(0x01020304));
        sbytes2 b = sbytes2(a);
        require(bytes2(b) == bytes2(0x0102));

        sbytes1 c = sbytes1(a);
        require(bytes1(c) == bytes1(0x01));

        sbytes8 d = sbytes8(bytes8(0xDEADBEEFCAFE1234));
        sbytes4 e = sbytes4(d);
        require(bytes4(e) == bytes4(0xDEADBEEF));

        sbytes2 f = sbytes2(d);
        require(bytes2(f) == bytes2(0xDEAD));

        sbytes32 g = sbytes32(bytes32(0xABCDEF0100000000000000000000000000000000000000000000000000000000));
        sbytes4 h = sbytes4(g);
        require(bytes4(h) == bytes4(0xABCDEF01));

        return true;
    }

    function testRoundTrip() public pure returns (bool) {
        // small -> large -> small should preserve original
        sbytes4 orig = sbytes4(bytes4(0xDEADBEEF));
        sbytes8 expanded = orig;
        sbytes4 back = sbytes4(expanded);
        require(bytes4(back) == bytes4(0xDEADBEEF));

        sbytes1 orig1 = sbytes1(bytes1(0xAB));
        sbytes32 big = orig1;
        sbytes1 back1 = sbytes1(big);
        require(bytes1(back1) == bytes1(0xAB));

        sbytes2 orig2 = sbytes2(bytes2(0xCAFE));
        sbytes16 mid = orig2;
        sbytes2 back2 = sbytes2(mid);
        require(bytes2(back2) == bytes2(0xCAFE));

        return true;
    }

    function testTruncationLoss() public pure returns (bool) {
        // Truncation loses right bytes
        sbytes4 a = sbytes4(bytes4(0x01020304));
        sbytes2 b = sbytes2(a);
        // Only 0x0102 survives
        require(bytes2(b) == bytes2(0x0102));

        // Expanding back does NOT restore lost bytes
        sbytes4 c = b;
        require(bytes4(c) == bytes4(0x01020000));
        require(bytes4(c) != bytes4(0x01020304));

        return true;
    }

    function testChainConversions() public pure returns (bool) {
        // Chain: sbytes1 -> sbytes4 -> sbytes16 -> sbytes32 -> sbytes4 -> sbytes1
        sbytes1 start = sbytes1(bytes1(0x42));
        sbytes4 step1 = start;
        sbytes16 step2 = step1;
        sbytes32 step3 = step2;
        sbytes4 step4 = sbytes4(step3);
        sbytes1 finish = sbytes1(step4);
        require(bytes1(finish) == bytes1(0x42));

        return true;
    }

    function testSameSizeExplicit() public pure returns (bool) {
        // Explicit conversion between same-size sbytes is identity
        sbytes4 a = sbytes4(bytes4(0xDEADBEEF));
        sbytes4 b = sbytes4(a);
        require(bytes4(b) == bytes4(0xDEADBEEF));

        return true;
    }
}
// ----
// testSmallToLarge() -> true
// testLargeToSmall() -> true
// testRoundTrip() -> true
// testTruncationLoss() -> true
// testChainConversions() -> true
// testSameSizeExplicit() -> true
