contract Test {
    function bytesToSuint(bytes4 s) public returns (uint64 h) {
        return uint64(suint64(suint32(s)));
    }
}
// ----
// bytesToSuint(bytes4): "abcd" -> 0x61626364
