contract Test {
    function bytesToSuint(bytes4 s) public returns (suint16 h) {
        return suint16(uint32(s));
    }
}
// ----
// bytesToSuint(bytes4): "abcd" -> 0x6364
