contract C {
    struct S {
        suint256 x;
        suint128 y;
        suint32 z;
        suint128[3] a1;
        suint128[] a2;
    }
    uint8 b = 23;
    S[] s;
    uint8 a = 17;
    function f() public {
        s.push();
        assert(uint256(s[0].x) == 0);
        assert(uint128(s[0].y) == 0);
        assert(uint32(s[0].z) == 0);
        assert(uint128(s[0].a1[0]) == 0);
        assert(uint128(s[0].a1[1]) == 0);
        assert(uint128(s[0].a1[2]) == 0);
        assert(uint256(s[0].a2.length) == 0);
        assert(b == 23);
        assert(a == 17);
    }
}
// ----
// f() ->
