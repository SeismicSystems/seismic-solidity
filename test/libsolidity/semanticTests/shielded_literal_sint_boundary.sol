contract C {
    sint8 private a;
    sint16 private b;
    sint32 private c;
    sint64 private d;

    function testInt8() public returns (int256, int256) {
        a = -128s;
        int256 lo = int(int8(a));
        a = 127s;
        int256 hi = int(int8(a));
        return (lo, hi);
    }

    function testInt16() public returns (int256, int256) {
        b = -32768s;
        int256 lo = int(int16(b));
        b = 32767s;
        int256 hi = int(int16(b));
        return (lo, hi);
    }

    function testInt32() public returns (int256, int256) {
        c = -2147483648s;
        int256 lo = int(int32(c));
        c = 2147483647s;
        int256 hi = int(int32(c));
        return (lo, hi);
    }

    function testInt64() public returns (int256, int256) {
        d = -9223372036854775808s;
        int256 lo = int(int64(d));
        d = 9223372036854775807s;
        int256 hi = int(int64(d));
        return (lo, hi);
    }
}
// ----
// testInt8() -> -128, 127
// testInt16() -> -32768, 32767
// testInt32() -> -2147483648, 2147483647
// testInt64() -> -9223372036854775808, 9223372036854775807
