contract C {
    suint16 x = suint16(0x1234);
    suint16 a = suint16(0xffff);
    suint16 b;
    function f() public returns (uint256, uint256, uint256, uint256) {
        unchecked { a = a + suint16(1); }
        uint256 c = uint16(b);
        delete b;
        unchecked { a = a - suint16(2); }
        return (uint16(x), c, uint16(b), uint16(a));
    }
}
// ----
// f() -> 0x1234, 0x0, 0x0, 0xfffe
