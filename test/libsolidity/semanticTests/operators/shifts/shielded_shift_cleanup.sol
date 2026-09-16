contract C {
    function f() public returns (uint16) {
        unchecked {
            suint16 x = suint16(0xffff);
            x += suint16(32);
            x <<= suint16(8);
            x >>= suint16(16);
            return uint16(x);
        }
    }
}
// ----
// f() -> 0x0
