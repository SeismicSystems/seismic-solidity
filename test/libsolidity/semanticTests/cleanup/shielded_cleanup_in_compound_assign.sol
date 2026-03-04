contract C {
    function test() public returns (uint256, uint256) {
        suint32 a = suint32(0xffffffff);
        suint16 x = suint16(uint16(a));
        suint16 y = x;
        x /= suint16(0x100);
        y = y / suint16(0x100);
        return (uint256(uint16(x)), uint256(uint16(y)));
    }
}
// ----
// test() -> 0xff, 0xff
