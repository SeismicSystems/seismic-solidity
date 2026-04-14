pragma abicoder v2;


contract C {
    struct S {
        suint256 a;
        suint256[2] b;
        suint256 c;
    }

    function f(S calldata s)
        external
        pure
        returns (uint256 a, uint256 b0, uint256 b1, uint256 c)
    {
        a = uint256(s.a);
        b0 = uint256(s.b[0]);
        b1 = uint256(s.b[1]);
        c = uint256(s.c);
    }
}
// ----
// f((suint256,suint256[2],suint256)): 42, 1, 2, 23 -> 42, 1, 2, 23
