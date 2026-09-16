pragma abicoder               v2;

contract C {
    struct S {
        suint256 a;
        sbool x;
    }

    function s() public returns(uint256, bool)
    {
        S memory r = S({x: sbool(true), a: suint256(8)});
        return (uint256(r.a), bool(r.x));
    }
}
// ----
// s() -> 8, true
