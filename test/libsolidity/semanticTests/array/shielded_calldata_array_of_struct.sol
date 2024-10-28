pragma abicoder               v2;


contract C {
    struct S {
        suint256 a;
        suint256 b;
    }

    function f(S[] calldata s)
        external
        pure
        returns (suint256 l, suint256 a, suint256 b, suint256 c, suint256 d)
    {
        l = s.length;
        a = s[0].a;
        b = s[0].b;
        c = s[1].a;
        d = s[1].b;
    }
}
// ----
// f((suint256,suint256)[]): 0x20, 0x2, 0x1, 0x2, 0x3, 0x4 -> 2, 1, 2, 3, 4

