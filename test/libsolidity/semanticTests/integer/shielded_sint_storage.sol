// New test: sint storage read/write via cstore/cload with sign extension
contract C {
    sint8 private s8;
    sint16 private s16;
    sint32 private s32;
    sint64 private s64;
    sint128 private s128;
    sint256 private s256;

    function testNegativeStorage() public returns (bool) {
        s8 = sint8(-1);
        s16 = sint16(-256);
        s32 = sint32(-65536);
        s64 = sint64(-4294967296);
        s128 = sint128(-18446744073709551616);
        s256 = type(sint256).min;

        require(int8(s8) == -1);
        require(int16(s16) == -256);
        require(int32(s32) == -65536);
        require(int64(s64) == -4294967296);
        require(int128(s128) == -18446744073709551616);
        require(int256(s256) == type(int256).min);

        return true;
    }

    function testMinMax() public returns (bool) {
        s8 = type(sint8).min;
        require(int8(s8) == -128);
        s8 = type(sint8).max;
        require(int8(s8) == 127);

        s16 = type(sint16).min;
        require(int16(s16) == -32768);
        s16 = type(sint16).max;
        require(int16(s16) == 32767);

        return true;
    }

    function testOverwrite() public returns (bool) {
        s256 = sint256(42);
        require(int256(s256) == 42);
        s256 = sint256(-42);
        require(int256(s256) == -42);
        s256 = sint256(0);
        require(int256(s256) == 0);

        return true;
    }
}
// ----
// testNegativeStorage() -> true
// testMinMax() -> true
// testOverwrite() -> true
