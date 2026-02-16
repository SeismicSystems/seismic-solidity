// Tests push 41 elements, pop all one-by-one verifying each value and length
// Adapted from byte_array_pop_long_storage_empty.sol (storageEmpty removed)
contract C {
    uint256 a;
    uint256 b;
    uint256 c;
    sbytes data;

    function test() public returns (bool) {
        for (uint8 i = 0; i <= 40; i++)
            data.push(sbytes1(uint8(i + 1)));
        for (int8 j = 40; j >= 0; j--) {
            require(data[uint8(j)] == sbytes1(uint8(j + 1)));
            require(uint256(suint256(data.length)) == uint8(j + 1));
            data.pop();
        }
        return true;
    }
}
// ----
// test() -> true
