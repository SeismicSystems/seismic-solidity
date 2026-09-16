contract C {
    struct S {
        suint256 x;
        suint128 y;
        suint32 z;
    }
    uint8 b = 23;
    S s;
    uint8 a = 17;
    function f() public {
        s.x = suint256(42); s.y = suint128(42); s.y = suint128(42);
        delete s;
        assert(uint256(s.x) == 0);
        assert(uint128(s.y) == 0);
        assert(uint32(s.z) == 0);
        assert(b == 23);
        assert(a == 17);
    }
}
// ----
// f() ->
