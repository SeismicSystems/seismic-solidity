contract Test {
    function suintToBytes(suint256 h) public returns (bytes32 s) {
        return bytes32(h);
    }
}
// ----
// suintToBytes(suint256): left(0x616263) -> left(0x616263)
