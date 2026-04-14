pragma abicoder               v2;

contract C {
    struct S {
        suint32 a;
        suint128 b;
        suint256 c;
    }
    struct X {
        suint32 a;
        S s;
    }

    uint[79] arr;
    X x = X(suint32(12), S(suint32(42), suint128(23), suint256(34)));

    function f() external returns (uint32, uint128, uint256) {
        X memory m = x;
        return (uint32(m.s.a), uint128(m.s.b), uint256(m.s.c));
    }
}
// ----
// f() -> 42, 23, 34
