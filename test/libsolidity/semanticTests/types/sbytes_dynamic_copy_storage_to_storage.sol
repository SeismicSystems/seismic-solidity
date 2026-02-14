// Tests copying sbytes from one storage variable to another at various lengths
contract C {
    sbytes a;
    sbytes b;

    function test(uint256 len) public returns (bool) {
        // Build 'a' via storage allocation + index writes
        a = new sbytes(len);
        for (uint256 i = 0; i < len; i++)
            a[i] = sbytes1(uint8(i));
        // Verify 'a' is correctly set
        for (uint256 i = 0; i < len; i++)
            require(a[i] == sbytes1(uint8(i)));
        // Copy a -> b
        b = a;
        // Verify 'b' has same content
        require(uint256(suint256(b.length)) == len);
        for (uint256 i = 0; i < len; i++)
            require(b[i] == sbytes1(uint8(i)));
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
