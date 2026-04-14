pragma abicoder               v2;


contract C {
    struct S {
        suint256 a;
        suint256 b;
    }

    function f(suint256 a, S calldata s, suint256 b)
        external
        pure
        returns (uint256, uint256, uint256, uint256)
    {
        return (uint256(a), uint256(s.a), uint256(s.b), uint256(b));
    }
}
// ----
// f(suint256,(suint256,suint256),suint256): 1, 2, 3, 4 -> 1, 2, 3, 4
