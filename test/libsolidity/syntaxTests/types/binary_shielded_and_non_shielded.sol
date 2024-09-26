contract C {
    function f(sint32 x, int32 y) external pure returns (sint32)
    {
        int32 z = y + x;
        return z;
    }
    // function g(sint32 x, int32 y) external pure returns (int32)
    // {
    //     int32 z = x + y;
    //     return z;
    // }
}
// ----

