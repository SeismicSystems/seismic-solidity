pragma abicoder               v2;


contract C {
    struct S {
        suint256 a;
        suint256 b;
    }

    function f(S[] calldata s)
        external
        pure
        returns (uint256 l, uint256 a, uint256 b, uint256 c, uint256 d)
    {
        l = uint(s.length);
        a = uint(s[suint(0)].a);
        b = uint(s[suint(0)].b);
        c = uint(s[suint(1)].a);
        d = uint(s[suint(1)].b);
    }
}
// ----
// f((suint256,suint256)[]): 0x20, 0x2, 0x1, 0x2, 0x3, 0x4 -> 2, 1, 2, 3, 4

