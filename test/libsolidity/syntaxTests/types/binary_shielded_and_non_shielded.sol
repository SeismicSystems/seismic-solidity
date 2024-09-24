contract C {
    function f(sint32 x, int32 y) external pure returns (sint32)
    {
        sint32 z = x + y;
        return z;
    }
}
// ----

