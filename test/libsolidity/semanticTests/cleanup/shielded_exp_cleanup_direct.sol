contract C {
    function f() public pure returns (uint8) {
        unchecked {
            return uint8(suint8(0)**suint8(suint8(2)**suint8(8)));
        }
    }
}
// ----
// f() -> 0x1
