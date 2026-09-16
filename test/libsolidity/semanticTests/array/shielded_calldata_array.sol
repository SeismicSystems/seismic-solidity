pragma abicoder               v2;


contract C {
    function f(suint256[2] calldata s)
        external
        pure
        returns (uint256 a, uint256 b)
    {
        a = uint(s[0]);
        b = uint(s[1]);
    }
}
// ----
// f(suint256[2]): 42, 23 -> 42, 23

