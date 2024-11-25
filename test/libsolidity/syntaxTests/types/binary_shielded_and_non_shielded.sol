contract C {
    function f(sint32 x, int32 y) external pure returns (int32)
    {
        sint32 z = y + x;
        return int32(z);
    }
    function g(sint32 x, int32 y) external pure returns (int32)
    {
        int32 z = x + y;
        return z;
    }
}
// ----
// TypeError 9574: (218-233): Type sint32 is not implicitly convertible to expected type int32.
