// Verify all 6 comparison operators for sbytes producing sbool
contract C {
    function testEquality() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0x42));
        sbytes1 b = sbytes1(bytes1(0x42));
        sbytes1 c = sbytes1(bytes1(0x43));
        require(bool(a == b));
        require(!bool(a == c));

        sbytes8 d = sbytes8(bytes8(0x0102030405060708));
        sbytes8 e = sbytes8(bytes8(0x0102030405060708));
        sbytes8 f = sbytes8(bytes8(0x0102030405060709));
        require(bool(d == e));
        require(!bool(d == f));

        sbytes32 g = sbytes32(bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));
        sbytes32 h = sbytes32(bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));
        require(bool(g == h));

        return true;
    }

    function testInequality() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0x42));
        sbytes1 b = sbytes1(bytes1(0x43));
        require(bool(a != b));
        require(!bool(a != a));

        sbytes4 c = sbytes4(bytes4(0xDEADBEEF));
        sbytes4 d = sbytes4(bytes4(0xCAFEBABE));
        require(bool(c != d));

        return true;
    }

    function testLessThan() public pure returns (bool) {
        // sbytes comparisons are unsigned, left-aligned byte-by-byte
        sbytes1 a = sbytes1(bytes1(0x01));
        sbytes1 b = sbytes1(bytes1(0x02));
        require(bool(a < b));
        require(!bool(b < a));
        require(!bool(a < a));

        sbytes1 zero = sbytes1(bytes1(0x00));
        sbytes1 max1 = sbytes1(bytes1(0xFF));
        require(bool(zero < max1));
        require(!bool(max1 < zero));

        // Left-alignment: first byte dominates
        sbytes2 c = sbytes2(bytes2(0x00FF));
        sbytes2 d = sbytes2(bytes2(0x0100));
        require(bool(c < d));

        return true;
    }

    function testGreaterThan() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0xFF));
        sbytes1 b = sbytes1(bytes1(0x00));
        require(bool(a > b));
        require(!bool(b > a));
        require(!bool(a > a));

        sbytes4 c = sbytes4(bytes4(0xFF000000));
        sbytes4 d = sbytes4(bytes4(0x00FFFFFF));
        require(bool(c > d));

        return true;
    }

    function testLessEqual() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0x42));
        sbytes1 b = sbytes1(bytes1(0x42));
        sbytes1 c = sbytes1(bytes1(0x43));
        require(bool(a <= b));
        require(bool(a <= c));
        require(!bool(c <= a));

        return true;
    }

    function testGreaterEqual() public pure returns (bool) {
        sbytes1 a = sbytes1(bytes1(0x42));
        sbytes1 b = sbytes1(bytes1(0x42));
        sbytes1 c = sbytes1(bytes1(0x41));
        require(bool(a >= b));
        require(bool(a >= c));
        require(!bool(c >= a));

        return true;
    }

    function testCompareZeroAndMax() public pure returns (bool) {
        sbytes1 z1 = sbytes1(bytes1(0x00));
        sbytes1 m1 = sbytes1(bytes1(0xFF));
        require(bool(z1 < m1));
        require(bool(m1 > z1));
        require(bool(z1 <= m1));
        require(bool(m1 >= z1));
        require(bool(z1 != m1));
        require(!bool(z1 == m1));

        sbytes32 z32 = sbytes32(bytes32(0));
        sbytes32 m32 = sbytes32(bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));
        require(bool(z32 < m32));
        require(bool(m32 > z32));

        return true;
    }

    function testLeftAlignmentOrdering() public pure returns (bool) {
        // In sbytes2, 0x0100 > 0x00FF because first byte 0x01 > 0x00
        sbytes2 a = sbytes2(bytes2(0x0100));
        sbytes2 b = sbytes2(bytes2(0x00FF));
        require(bool(a > b));

        // In sbytes4, first byte determines order
        sbytes4 c = sbytes4(bytes4(0x01000000));
        sbytes4 d = sbytes4(bytes4(0x00FFFFFF));
        require(bool(c > d));

        return true;
    }
}
// ----
// testEquality() -> true
// testInequality() -> true
// testLessThan() -> true
// testGreaterThan() -> true
// testLessEqual() -> true
// testGreaterEqual() -> true
// testCompareZeroAndMax() -> true
// testLeftAlignmentOrdering() -> true
