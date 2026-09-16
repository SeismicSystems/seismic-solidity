// Adapted from: test/libsolidity/semanticTests/operators/shifts/shift_right_negative_lvalue_int8.sol
contract C {
    function f(sint8 a, suint8 b) public returns (int256) {
        return int256(a >> b);
    }
}
// ----
// f(sint8,suint8): -66, 0 -> -66
// f(sint8,suint8): -66, 1 -> -33
// f(sint8,suint8): -66, 4 -> -5
// f(sint8,suint8): -66, 8 -> -1
// f(sint8,suint8): -66, 16 -> -1
// f(sint8,suint8): -66, 17 -> -1
// f(sint8,suint8): -67, 0 -> -67
// f(sint8,suint8): -67, 1 -> -34
// f(sint8,suint8): -67, 4 -> -5
// f(sint8,suint8): -67, 8 -> -1
// f(sint8,suint8): -67, 16 -> -1
// f(sint8,suint8): -67, 17 -> -1
