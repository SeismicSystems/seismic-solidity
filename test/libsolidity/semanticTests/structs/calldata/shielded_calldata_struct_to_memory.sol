pragma abicoder v2;

contract C {
    struct S {
        suint256 a;
        suint256 b;
        sbytes2 c;
    }

    function f(S calldata s) external pure returns (uint256, uint256, bytes1) {
        S memory m = s;
        return (uint256(m.a), uint256(m.b), bytes2(m.c)[1]);
    }
}
// ----
// f((suint256,suint256,sbytes2)): 42, 23, "ab" -> 42, 23, "b"
