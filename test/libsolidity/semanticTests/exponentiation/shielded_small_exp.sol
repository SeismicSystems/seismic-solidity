contract test {
    suint32 x;
    suint8 y;
    function f() public returns (uint) {
        assembly {
            cstore(x.slot, 0xfffffffffe)
            cstore(y.slot, 0x102)
        }
        // After cleanup: x = 0xfffffffe, y = 0x02
        // x**y as uint32: (0xfffffffe)^2 mod 2^32 = (-2)^2 mod 2^32 = 4
        unchecked {
            suint r = suint(x**y);
            return uint(r);
        }
    }
}
// ----
// f() -> 4
