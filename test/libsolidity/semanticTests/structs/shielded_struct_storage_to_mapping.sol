contract C {
    struct S {
        suint256 a;
    }
    S s;
    mapping (uint => S) m;

    function f() external returns (bool) {
        s.a = suint256(12);
        m[1] = s;
        return uint256(m[1].a) == 12;
    }
}
// ----
// f() -> true
