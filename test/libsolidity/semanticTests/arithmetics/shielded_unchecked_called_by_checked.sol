contract C {
    function add(suint16 a, suint16 b) public returns (uint16) {
        unchecked {
            return uint16(a + b);
        }
    }
    function f(suint16 a) public returns (uint16) {
        return add(a, suint16(0x100)) + 0x100;
    }
}
// ----
// f(suint16): 7 -> 0x0207
// f(suint16): 0xffff -> 511
// f(suint16): 0xfeff -> FAILURE, hex"4e487b71", 0x11
