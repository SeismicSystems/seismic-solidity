pragma abicoder               v2;


contract C {
    struct S {
        suint256 a;
        suint256 b;
    }

    function f(S calldata s) external pure returns (uint256 a, uint256 b) {
        a = uint256(s.a);
        b = uint256(s.b);
    }
}
// ----
// f((suint256,suint256)): 42, 23 -> 42, 23
