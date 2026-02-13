// Tests copying sbytes from storage to memory at various lengths
contract C {
    sbytes s;

    function test(uint256 len) public returns (bool) {
        // Build storage array via allocation + index writes
        s = new sbytes(len);
        for (uint256 i = 0; i < len; i++)
            s[i] = sbytes1(uint8(i));
        // Copy storage to memory
        sbytes memory data = s;
        require(uint256(suint256(data.length)) == len);
        for (uint256 i = 0; i < len; i++)
            require(data[i] == sbytes1(uint8(i)));
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
