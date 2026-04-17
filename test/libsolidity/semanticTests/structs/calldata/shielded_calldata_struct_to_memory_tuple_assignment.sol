pragma abicoder v2;

contract C {
    struct S {
        suint128 p1;
        suint256[][2] a;
        suint32 p2;
    }

    function f(uint32 p1, S calldata c) external returns(uint32, uint128, uint256, uint256, uint32) {
        S memory m;
        uint32 p2;
        (p2, m) = (p1, c);
        m.p1 = suint128(uint128(m.p1) + 1);
        m.a[0][1] = suint256(uint256(m.a[0][1]) + 1);
        return (p2, uint128(m.p1), uint256(m.a[0][0]), uint256(m.a[1][1]), uint32(m.p2));
    }
}
// ----
// f(uint32,(suint128,suint256[][2],suint32)): 55, 0x40, 77, 0x60, 88, 0x40, 0x40, 2, 1, 2 -> 55, 78, 1, 2, 88
