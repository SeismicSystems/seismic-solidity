contract C {
    suint8 x;
    function f() public returns (uint8) {
        assembly {
            cstore(x.slot, 0xffff)
        }
        x >>= suint8(8);
        return uint8(x);
    }
}
// ----
// f() -> 0x0
