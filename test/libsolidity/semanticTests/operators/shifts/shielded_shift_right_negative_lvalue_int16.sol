// Adapted from: test/libsolidity/semanticTests/operators/shifts/shift_right_negative_lvalue_int16.sol
contract C {
    function f(sint16 a, suint16 b) public returns (int256) {
        return int256(a >> b);
    }
}
// ----
// f(sint16,suint16): -4266, 0 -> -4266
// f(sint16,suint16): -4266, 1 -> -2133
// f(sint16,suint16): -4266, 4 -> -267
// f(sint16,suint16): -4266, 8 -> -17
// f(sint16,suint16): -4266, 16 -> -1
// f(sint16,suint16): -4266, 17 -> -1
// f(sint16,suint16): -4267, 0 -> -4267
// f(sint16,suint16): -4267, 1 -> -2134
// f(sint16,suint16): -4267, 4 -> -267
// f(sint16,suint16): -4267, 8 -> -17
// f(sint16,suint16): -4267, 16 -> -1
// f(sint16,suint16): -4267, 17 -> -1
