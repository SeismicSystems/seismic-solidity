// Adapted from: test/libsolidity/semanticTests/viaYul/detect_mod_zero_signed.sol
contract C {
    function f(sint256 a, sint256 b) public pure returns (int256 x) {
        x = int256(a % b);
    }
    function g(sint8 a, sint8 b) public pure returns (int8 x) {
        x = int8(a % b);
    }
}
// ----
// f(sint256,sint256): 10, 3 -> 1
// f(sint256,sint256): 10, 2 -> 0
// f(sint256,sint256): 11, 2 -> 1
// f(sint256,sint256): -10, 3 -> -1
// f(sint256,sint256): 10, -3 -> 1
// f(sint256,sint256): -10, -3 -> -1
// f(sint256,sint256): 2, 2 -> 0
// f(sint256,sint256): 1, 0 -> FAILURE, hex"4e487b71", 0x12
// f(sint256,sint256): -1, 0 -> FAILURE, hex"4e487b71", 0x12
// f(sint256,sint256): 0, 0 -> FAILURE, hex"4e487b71", 0x12
// f(sint256,sint256): 0, 1 -> 0
// f(sint256,sint256): 0, -1 -> 0
// g(sint8,sint8): 10, 3 -> 1
// g(sint8,sint8): 10, 2 -> 0
// g(sint8,sint8): 11, 2 -> 1
// g(sint8,sint8): -10, 3 -> -1
// g(sint8,sint8): 10, -3 -> 1
// g(sint8,sint8): -10, -3 -> -1
// g(sint8,sint8): 2, 2 -> 0
// g(sint8,sint8): 1, 0 -> FAILURE, hex"4e487b71", 0x12
// g(sint8,sint8): -1, 0 -> FAILURE, hex"4e487b71", 0x12
// g(sint8,sint8): 0, 0 -> FAILURE, hex"4e487b71", 0x12
// g(sint8,sint8): 0, 1 -> 0
// g(sint8,sint8): 0, -1 -> 0
// g(sint8,sint8): -128, -128 -> 0
// g(sint8,sint8): -128, 127 -> -1
