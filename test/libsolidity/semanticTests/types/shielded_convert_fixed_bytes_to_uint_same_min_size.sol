contract Test {
    function bytesToSuint(bytes1 s) public returns (suint8 h) {
        return suint8(s);
    }
}
// ----
// bytesToSuint(bytes1): "a" -> 0x61

