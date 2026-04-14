pragma abicoder v2;

contract C {
    struct S {
        suint256 a;
        suint64 b;
        bytes2 c;
    }

    uint[153] r;
    S s;

    function f(uint32 a, S calldata c, uint256 b) external returns (uint256, uint64, bytes1) {
        s = c;
        return (uint256(s.a), uint64(s.b), s.c[1]);
    }
}
// ----
// f(uint32,(suint256,suint64,bytes2),uint256): 1, 42, 23, "ab", 1 -> 42, 23, "b"
