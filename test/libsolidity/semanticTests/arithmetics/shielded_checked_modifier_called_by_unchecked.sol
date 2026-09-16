contract C {
    modifier add(suint16 a, suint16 b) {
        unchecked { a + b; }
        _;
    }
    function f(suint16 a, suint16 b, suint16 c) public add(a, b) returns (uint16) {
        return uint16(b + c);
    }
}
// ----
// f(suint16,suint16,suint16): 0xe000, 0xe500, 2 -> 58626
// f(suint16,suint16,suint16): 0x1000, 0xe500, 0xe000 -> FAILURE, hex"4e487b71", 0x11
