pragma abicoder v2;

contract C {
    struct S {
        suint128 p1;
        suint256[][2] a;
        suint32 p2;
    }

    struct S1 {
        suint128 u;
        S s;
    }

    struct S2 {
        S[2] array;
    }

    function f1(S1 calldata c) internal returns(S1 calldata) {
        return c;
    }

    function f(S1 calldata c, uint32 p) external returns(uint32, uint128, uint256, uint256, uint32) {
        S1 memory m = f1(c);
        assert(uint256(m.s.a[0][0]) == uint256(c.s.a[0][0]));
        assert(uint256(m.s.a[1][1]) == uint256(c.s.a[1][1]));
        return (p, uint128(m.s.p1), uint256(m.s.a[0][0]), uint256(m.s.a[1][1]), uint32(m.s.p2));
    }

    function g(S2 calldata c) external returns(uint128, uint256, uint256, uint32) {
        S2 memory m = c;
        assert(uint256(m.array[0].a[0][0]) == uint256(c.array[0].a[0][0]));
        assert(uint256(m.array[0].a[1][1]) == uint256(c.array[0].a[1][1]));
        return (uint128(m.array[1].p1), uint256(m.array[1].a[0][0]), uint256(m.array[1].a[1][1]), uint32(m.array[1].p2));
    }

    function h(S1 calldata c, uint32 p) external returns(uint32, uint128, uint256, uint256, uint32) {
        S memory m = c.s;
        assert(uint256(m.a[0][0]) == uint256(c.s.a[0][0]));
        assert(uint256(m.a[1][1]) == uint256(c.s.a[1][1]));
        return (p, uint128(m.p1), uint256(m.a[0][0]), uint256(m.a[1][1]), uint32(m.p2));
    }
}
// ----
// f((suint128,(suint128,suint256[][2],suint32)),uint32): 0x40, 44, 11, 0x40, 22, 0x60, 33, 0x40, 0x40, 2, 1, 2 -> 44, 22, 1, 2, 33
// g(((suint128,suint256[][2],suint32)[2])): 0x20, 0x20, 0x40, 0x40, 22, 0x60, 33, 0x40, 0x40, 2, 1, 2 -> 22, 1, 2, 33
// h((suint128,(suint128,suint256[][2],suint32)),uint32): 0x40, 44, 11, 0x40, 22, 0x60, 33, 0x40, 0x40, 2, 1, 2 -> 44, 22, 1, 2, 33
