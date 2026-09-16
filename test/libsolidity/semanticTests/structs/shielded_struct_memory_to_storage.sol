pragma abicoder               v2;

contract C {
    struct S {
        suint32 a;
        suint128 b;
        suint256 c;
    }

    struct X {
        suint256 a;
        S s;
    }

    uint[79] r;
    X x;

    function f() external returns (uint32, uint128, uint256) {
        X memory m = X(suint256(12), S(suint32(42), suint128(23), suint256(34)));
        x = m;
        return (uint32(x.s.a), uint128(x.s.b), uint256(x.s.c));
    }
}
// ----
// f() -> 42, 23, 34
