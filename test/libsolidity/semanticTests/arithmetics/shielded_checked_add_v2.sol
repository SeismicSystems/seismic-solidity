pragma abicoder v2;
contract C {
    function f(suint16 a, suint16 b) public returns (suint16) {
        return a + b;
    }
}
// ----
// f(suint16,suint16): 65534, 0 -> 0xfffe
// f(suint16,suint16): 65536, 0 -> FAILURE
// f(suint16,suint16): 65535, 0 -> 0xffff
// f(suint16,suint16): 65535, 1 -> FAILURE, hex"4e487b71", 0x11
