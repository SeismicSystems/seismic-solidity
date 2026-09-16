contract C {
    function f() public pure returns (uint8) {
        unchecked {
            suint16 x = suint16(0x166);
            return uint8(suint8(uint8(x))**suint8(suint8(2)**suint8(8)));
        }
    }
}
// ----
// f() -> 0x1
