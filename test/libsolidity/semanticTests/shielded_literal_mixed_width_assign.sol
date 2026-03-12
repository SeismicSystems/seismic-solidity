contract C {
    suint8 private a;
    suint16 private b;
    suint32 private c;
    suint256 private d;

    // Same literal value assigned to different widths
    function testSameValue() public returns (uint256, uint256, uint256, uint256) {
        a = 42s;
        b = 42s;
        c = 42s;
        d = 42s;
        return (uint(uint8(a)), uint(uint16(b)), uint(uint32(c)), uint(d));
    }

    // Width-specific max values
    function testMaxValues() public returns (uint256, uint256) {
        a = 255s;
        b = 65535s;
        return (uint(uint8(a)), uint(uint16(b)));
    }
}
// ----
// testSameValue() -> 42, 42, 42, 42
// testMaxValues() -> 255, 65535
