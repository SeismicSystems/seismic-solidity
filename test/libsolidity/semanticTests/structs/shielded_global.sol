pragma abicoder               v2;

struct S { suint256 a; suint256 b; }
contract C {
    function f(S calldata s) external pure returns (uint256, uint256) {
        return (uint256(s.a), uint256(s.b));
    }
}
// ----
// f((suint256,suint256)): 42, 23 -> 42, 23
