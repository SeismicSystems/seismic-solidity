contract C {
    struct S {
        uint8 a;
        bool b;
        suint256 c;
        uint128 d;
    }

    S s;

    function f() public returns (uint8, bool, uint128) {
        s.a = 42;
        s.b = true;
        s.c = suint256(99);
        s.d = 12345;
        delete s;
        return (s.a, s.b, s.d);
    }
}
// ----
// f() -> 0, false, 0
