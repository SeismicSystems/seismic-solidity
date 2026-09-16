contract Test {
    function bytesToSuint(bytes4 s) public returns (uint16 h) {
        return uint16(suint16(uint32(s)));
    }
}
// ----
// bytesToSuint(bytes4): "abcd" -> 0x6364
