pragma abicoder               v2;


contract C {
    function f(suint256[2] calldata s)
        external
        pure
        returns (suint256 a, suint256 b)
    {
        a = s[0];
        b = s[1];
    }
}
// ----
// f(suint256[2]): 42, 23 -> 42, 23

