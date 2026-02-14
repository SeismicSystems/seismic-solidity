// Tests allocating sbytes storage at various lengths and writing via index
// (Memory sbytes index writes are not yet supported, so we use new + storage index writes)
contract C {
    sbytes s;

    function test(uint256 len) public returns (bool) {
        s = new sbytes(len);
        require(uint256(suint256(s.length)) == len);
        for (uint256 i = 0; i < len; i++)
            s[i] = sbytes1(uint8(i));
        for (uint256 i = 0; i < len; i++)
            require(s[i] == sbytes1(uint8(i)));
        return true;
    }
}
// ----
// test(uint256): 0 -> true
// test(uint256): 12 -> true
// test(uint256): 31 -> true
// test(uint256): 32 -> true
// test(uint256): 33 -> true
// test(uint256): 63 -> true
// test(uint256): 129 -> true
