pragma abicoder v2;

contract C {
    struct S {
        suint32 a;
        suint256[] b;
        suint64 c;
    }

    function f(S calldata s)
        external
        pure
        returns (uint32 a, uint256 b0, uint256 b1, uint64 c)
    {
        a = uint32(s.a);
        b0 = uint256(s.b[0]);
        b1 = uint256(s.b[1]);
        c = uint64(s.c);
    }
}
// ----
// f((suint32,suint256[],suint64)): 0x20, 42, 0x60, 23, 2, 1, 2 -> 42, 1, 2, 23
