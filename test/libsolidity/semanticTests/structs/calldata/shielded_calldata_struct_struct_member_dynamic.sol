pragma abicoder v2;

contract C {
    struct S {
        suint64 a;
        bytes b;
    }
    struct S1 {
        suint256 a;
        S s;
        suint256 c;
    }

    function f(S1 calldata s1)
        external
        pure
        returns (uint256 a, uint64 b0, bytes1 b1, uint256 c)
    {
        a = uint256(s1.a);
        b0 = uint64(s1.s.a);
        b1 = s1.s.b[0];
        c = uint256(s1.c);
    }
}
// ----
// f((suint256,(suint64,bytes),suint256)): 0x20, 42, 0x60, 23, 1, 0x40, 2, "ab" -> 42, 1, "a", 23
