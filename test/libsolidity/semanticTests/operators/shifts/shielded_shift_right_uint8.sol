contract C {
    function f(suint8 a, suint8 b) public returns (uint256) {
        return uint256(a >> b);
    }
}
// ----
// f(suint8,suint8): 0x66, 0x0 -> 0x66
// f(suint8,suint8): 0x66, 0x8 -> 0x0
