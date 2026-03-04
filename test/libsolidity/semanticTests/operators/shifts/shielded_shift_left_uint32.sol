contract C {
    function f(suint32 a, suint32 b) public returns (uint256) {
        return uint256(a << b);
    }
}
// ----
// f(suint32,suint32): 0x4266, 0x0 -> 0x4266
// f(suint32,suint32): 0x4266, 0x8 -> 0x426600
// f(suint32,suint32): 0x4266, 0x10 -> 0x42660000
// f(suint32,suint32): 0x4266, 0x11 -> 0x84cc0000
// f(suint32,suint32): 0x4266, 0x20 -> 0
