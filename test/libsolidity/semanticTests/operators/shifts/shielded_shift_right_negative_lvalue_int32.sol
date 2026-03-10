contract C {
    function f(sint32 a, suint32 b) public returns (int256) {
        return int256(a >> b);
    }
}
// ----
// f(sint32,suint32): -4266, 0 -> -4266
// f(sint32,suint32): -4266, 1 -> -2133
// f(sint32,suint32): -4266, 4 -> -267
// f(sint32,suint32): -4266, 8 -> -17
// f(sint32,suint32): -4266, 16 -> -1
// f(sint32,suint32): -4266, 17 -> -1
// f(sint32,suint32): -4267, 0 -> -4267
// f(sint32,suint32): -4267, 1 -> -2134
// f(sint32,suint32): -4267, 4 -> -267
// f(sint32,suint32): -4267, 8 -> -17
// f(sint32,suint32): -4267, 16 -> -1
// f(sint32,suint32): -4267, 17 -> -1
