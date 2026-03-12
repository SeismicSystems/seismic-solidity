contract C {
    suint8 private a;
    suint16 private b;
    suint32 private c;
    suint64 private d;
    suint128 private e;
    suint256 private f;

    function testUint8() public returns (uint256, uint256) {
        a = 0s;
        uint256 lo = uint(uint8(a));
        a = 255s;
        uint256 hi = uint(uint8(a));
        return (lo, hi);
    }

    function testUint16() public returns (uint256, uint256) {
        b = 0s;
        uint256 lo = uint(uint16(b));
        b = 65535s;
        uint256 hi = uint(uint16(b));
        return (lo, hi);
    }

    function testUint32() public returns (uint256, uint256) {
        c = 0s;
        uint256 lo = uint(uint32(c));
        c = 4294967295s;
        uint256 hi = uint(uint32(c));
        return (lo, hi);
    }

    function testUint64() public returns (uint256, uint256) {
        d = 0s;
        uint256 lo = uint(uint64(d));
        d = 18446744073709551615s;
        uint256 hi = uint(uint64(d));
        return (lo, hi);
    }

    function testUint128() public returns (uint256, uint256) {
        e = 0s;
        uint256 lo = uint(uint128(e));
        e = 340282366920938463463374607431768211455s;
        uint256 hi = uint(uint128(e));
        return (lo, hi);
    }

    function testUint256Max() public returns (uint256) {
        f = 115792089237316195423570985008687907853269984665640564039457584007913129639935s;
        return uint(f);
    }
}
// ----
// testUint8() -> 0, 255
// testUint16() -> 0, 65535
// testUint32() -> 0, 4294967295
// testUint64() -> 0, 18446744073709551615
// testUint128() -> 0, 340282366920938463463374607431768211455
// testUint256Max() -> 115792089237316195423570985008687907853269984665640564039457584007913129639935
