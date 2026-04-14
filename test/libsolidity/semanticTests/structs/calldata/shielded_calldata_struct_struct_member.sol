pragma abicoder v2;

contract C {
    struct S {
        suint64 a;
        suint64 b;
    }
    struct S1 {
        suint256 a;
        S s;
        suint256 c;
    }

    function f(S1 calldata s1)
        external
        pure
        returns (uint256 a, uint64 b0, uint64 b1, uint256 c)
    {
        a = uint256(s1.a);
        b0 = uint64(s1.s.a);
        b1 = uint64(s1.s.b);
        c = uint256(s1.c);
    }
}
// ----
// f((suint256,(suint64,suint64),suint256)): 42, 1, 2, 23 -> 42, 1, 2, 23
