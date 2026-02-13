// Tests getting length of sbytes calldata
contract C {
    function getLength(sbytes calldata data) external returns (uint256) {
        return uint256(suint256(data.length));
    }
}
// ----
// getLength(sbytes): 0x20, 0 -> 0
// getLength(sbytes): 0x20, 5, 0x0102030405000000000000000000000000000000000000000000000000000000 -> 5
// getLength(sbytes): 0x20, 40, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20, 0x2122232425262728000000000000000000000000000000000000000000000000 -> 40
