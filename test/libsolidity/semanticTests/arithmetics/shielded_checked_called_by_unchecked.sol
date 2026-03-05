contract C {
    function add(suint16 a, suint16 b) public returns (uint16) {
        return uint16(a + b);
    }
    function f(suint16 a, suint16 b, suint16 c) public returns (uint16) {
        unchecked { return uint16(suint16(add(a, b)) + c); }
    }
}
// ----
// f(suint16,suint16,suint16): 0xe000, 0xe500, 2 -> FAILURE, hex"4e487b71", 0x11
// f(suint16,suint16,suint16): 0xe000, 0x1000, 0x1000 -> 0x00
