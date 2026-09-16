contract C {
    struct S {
        uint8 a;
        suint256 b;
    }

    S s;

    function f() public returns (uint8) {
        s.a = 42;
        s.b = suint256(7);
        delete s;
        return s.a;
    }
}
// ----
// f() -> 0
