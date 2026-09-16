contract Test {
    function bytesToSuint(bytes1 s) public returns (uint8 h) {
        return uint8(suint8(s));
    }
}
// ----
// bytesToSuint(bytes1): "a" -> 0x61

