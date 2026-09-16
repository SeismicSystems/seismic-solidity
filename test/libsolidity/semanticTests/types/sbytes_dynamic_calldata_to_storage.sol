// Tests copying sbytes calldata to storage for short and long values
// Adapted from calldata_bytes_to_storage.sol
contract C {
    sbytes s;

    function setShort(sbytes calldata data) external returns (bool) {
        s = data;
        require(uint256(suint256(s.length)) == 3);
        require(s[0] == sbytes1(0x61));
        require(s[1] == sbytes1(0x62));
        require(s[2] == sbytes1(0x63));
        return true;
    }

    function setLong(sbytes calldata data) external returns (bool) {
        s = data;
        require(uint256(suint256(s.length)) == 40);
        require(s[0] == sbytes1(0x01));
        require(s[39] == sbytes1(0x28));
        return true;
    }
}
// ----
// setShort(sbytes): 0x20, 3, 0x6162630000000000000000000000000000000000000000000000000000000000 -> true
// setLong(sbytes): 0x20, 40, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20, 0x2122232425262728000000000000000000000000000000000000000000000000 -> true
