contract test {
    function f() public pure returns (int, int) {
        sint32 x = sint32(-3);
        uint8 y1;
        uint8 y2;
        assembly {
            y1 := 0x102
            y2 := 0x103
        }
        return (int32(x**y1), int32(x**y2));
    }
}
// ----
// f() -> 9, -27
