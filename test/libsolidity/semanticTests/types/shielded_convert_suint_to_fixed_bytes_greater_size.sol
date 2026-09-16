contract Test {
    function SuintToBytes(suint16 h) public returns (bytes8 s) {
        return bytes8(suint64(h));
    }
}
// ----
// SuintToBytes(suint16): 0x6162 -> "\x00\x00\x00\x00\x00\x00ab"

