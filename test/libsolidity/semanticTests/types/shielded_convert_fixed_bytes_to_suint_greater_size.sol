contract Test {
    function bytesToSuint(bytes4 s) public returns (suint64 h) {
        return suint64(suint32(s));
    }
}
// ----
// bytesToSuint(bytes4): "abcd" -> 0x61626364
