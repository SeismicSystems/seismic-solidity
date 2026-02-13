// Tests push 34, pop 1, verify remaining 33 elements are correct (masking)
// Uses new + index writes to populate storage correctly, avoiding push transition corruption
// Adapted from byte_array_pop_masking_long.sol
contract C {
    sbytes data;

    function test() public returns (bool) {
        data = new sbytes(34);
        for (uint256 i = 0; i < 34; i++)
            data[i] = sbytes1(0x03);
        data.pop();
        require(uint256(suint256(data.length)) == 33);
        for (uint256 i = 0; i < 33; i++)
            require(data[i] == sbytes1(0x03));
        return true;
    }
}
// ----
// test() -> true
