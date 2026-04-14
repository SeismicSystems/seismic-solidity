pragma abicoder v2;

contract C {
    struct S {
        suint256 a;
        suint256[2] b;
        suint256 c;
    }

    function f(S calldata c)
        external
        pure
        returns (uint256, uint256, uint256, uint256)
    {
        S memory m = c;
        return (uint256(m.a), uint256(m.b[0]), uint256(m.b[1]), uint256(m.c));
    }
}
// ----
// f((suint256,suint256[2],suint256)): 42, 1, 2, 23 -> 42, 1, 2, 23
