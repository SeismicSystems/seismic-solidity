contract C {
    struct S {
        suint256 a;
        sbool x;
    }
    S private s;

    constructor() {
        s = S({x: sbool(true), a: suint256(1)});
    }

    function getData() public returns (uint256, bool) {
        return (uint256(s.a), bool(s.x));
    }
}
// ----
// getData() -> 1, true
