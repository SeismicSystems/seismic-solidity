contract C {
    suint8 private a;
    sint8 private b;

    function testUncheckedOverflow() public returns (uint256) {
        unchecked {
            a = 255s;
            a = a + suint8(1s);
        }
        return uint(uint8(a));
    }

    function testUncheckedUnderflow() public returns (uint256) {
        unchecked {
            a = 0s;
            a = a - suint8(1s);
        }
        return uint(uint8(a));
    }

    function testUncheckedSignedOverflow() public returns (int256) {
        unchecked {
            b = 127s;
            b = b + sint8(1s);
        }
        return int(int8(b));
    }
}
// ----
// testUncheckedOverflow() -> 0
// testUncheckedUnderflow() -> 255
// testUncheckedSignedOverflow() -> -128
