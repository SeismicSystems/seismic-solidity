contract test {
    suint16 sA;
    suint32 sB;
    function f() public returns (uint x, uint y, uint z) {
        assembly {
            cstore(sA.slot, 0x0f0f0f0f0f)
            cstore(sB.slot, 0xff0fff0fff)
        }
        // After cleanup: sA = 0x0f0f, sB = 0x0fff0fff
        // Need same types for bitwise ops, cast sA to suint32
        suint32 a32 = suint32(uint32(uint16(sA)));
        x = uint(uint32(a32 & sB));
        y = uint(uint32(a32 | sB));
        z = uint(uint32(a32 ^ sB));
    }
}
// ----
// f() -> 3855, 268374015, 268370160
