contract Test {
    function uintToBytes(suint32 h) public returns (bytes2 s) {
        return bytes2(uint16(h));
    }
}
// ----
// uintToBytes(suint32): 0x61626364 -> "cd"
