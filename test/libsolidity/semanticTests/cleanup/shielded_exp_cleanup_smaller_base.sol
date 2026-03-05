contract C {
    function f() public pure returns (uint16) {
        suint16 e = suint16(0x100);
        suint8 b = suint8(0x2);
        unchecked {
            return uint16(b**e);
        }
    }
}
// ----
// f() -> 0x00
