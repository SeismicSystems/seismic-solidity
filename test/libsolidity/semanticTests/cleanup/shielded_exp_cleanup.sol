contract C {
    function f() public pure returns (uint) {
        unchecked {
            suint8 y = suint8(2)**suint8(8);
            return uint(suint(0)**suint(y));
        }
    }
}
// ----
// f() -> 0x1
