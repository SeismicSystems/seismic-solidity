// Tests push 33 elements, pop 4, verify remaining contents
// Adapted from byte_array_pop_copy_long.sol
contract C {
    sbytes data;

    function test() public returns (bool) {
        for (uint256 i = 0; i < 33; i++)
            data.push(sbytes1(0x03));
        for (uint256 j = 0; j < 4; j++)
            data.pop();
        require(uint256(suint256(data.length)) == 29);
        for (uint256 i = 0; i < 29; i++)
            require(data[i] == sbytes1(0x03));
        return true;
    }
}
// ----
// test() -> true
