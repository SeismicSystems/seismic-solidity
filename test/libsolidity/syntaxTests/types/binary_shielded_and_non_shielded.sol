contract C {
    function f(sint32 x, int32 y) external pure returns (int32)
    {
        sint32 z = sint32(y) + x;
        return z;
    }
    function g(sint32 x, int32 y) external pure returns (int32)
    {
        int32 z = int32(x) + y;
        return z;
    }
}
// ----
// TypeError 6359: (132-133): Return argument type sint32 is not implicitly convertible to expected type (type of first return variable) int32.
