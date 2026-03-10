pragma abicoder v2;
contract C {
    function f(sint16 a, sint16 b) public returns (int16) {
        return int16(a + b);
    }
}
// ----
// f(sint16,sint16): -32768, -1 -> FAILURE, hex"4e487b71", 0x11
// f(sint16,sint16): 32767, 1 -> FAILURE, hex"4e487b71", 0x11
// f(sint16,sint16): -100, 50 -> -50
// f(sint16,sint16): 100, -50 -> 50
// f(sint16,sint16): -100, -100 -> -200
// f(sint16,sint16): 0, 0 -> 0
