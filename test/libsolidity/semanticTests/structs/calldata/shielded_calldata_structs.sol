pragma abicoder               v2;


contract C {
    struct S1 {
        suint256 a;
        suint256 b;
    }
    struct S2 {
        suint256 a;
    }

    function f(S1 calldata s1, S2 calldata s2, S1 calldata s3)
        external
        pure
        returns (uint256 a, uint256 b, uint256 c, uint256 d, uint256 e)
    {
        a = uint256(s1.a);
        b = uint256(s1.b);
        c = uint256(s2.a);
        d = uint256(s3.a);
        e = uint256(s3.b);
    }
}
// ----
// f((suint256,suint256),(suint256),(suint256,suint256)): 1, 2, 3, 4, 5 -> 1, 2, 3, 4, 5
