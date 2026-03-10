contract C {
    function testLt() public pure returns (bool, bool, bool) {
        sint256 neg = sint256(-10);
        sint256 pos = sint256(10);
        sint256 zero = sint256(0);
        return (
            bool(neg < pos),
            bool(neg < zero),
            bool(pos < neg)
        );
    }

    function testGt() public pure returns (bool, bool, bool) {
        sint256 neg = sint256(-10);
        sint256 pos = sint256(10);
        sint256 zero = sint256(0);
        return (
            bool(pos > neg),
            bool(zero > neg),
            bool(neg > pos)
        );
    }

    function testEq() public pure returns (bool, bool, bool) {
        sint256 a = sint256(-42);
        sint256 b = sint256(-42);
        sint256 c = sint256(42);
        return (
            bool(a == b),
            bool(a != c),
            bool(a == c)
        );
    }

    function testLeGe() public pure returns (bool, bool, bool, bool) {
        sint256 a = sint256(-5);
        sint256 b = sint256(-5);
        sint256 c = sint256(5);
        return (
            bool(a <= b),
            bool(a >= b),
            bool(a <= c),
            bool(c >= a)
        );
    }

    function testMinMax() public pure returns (bool, bool) {
        sint256 minVal = type(sint256).min;
        sint256 maxVal = type(sint256).max;
        return (
            bool(minVal < maxVal),
            bool(maxVal > minVal)
        );
    }
}
// ----
// testLt() -> true, true, false
// testGt() -> true, true, false
// testEq() -> true, true, false
// testLeGe() -> true, true, true, true
// testMinMax() -> true, true
