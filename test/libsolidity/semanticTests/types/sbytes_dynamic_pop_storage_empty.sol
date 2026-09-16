// Tests push 3, pop all, verify length is zero
// Adapted from byte_array_pop_storage_empty.sol (storageEmpty removed)
contract C {
    sbytes data;

    function test() public returns (bool) {
        data.push(sbytes1(0x07));
        data.push(sbytes1(0x05));
        data.push(sbytes1(0x03));
        data.pop();
        data.pop();
        data.pop();
        require(uint256(suint256(data.length)) == 0);
        return true;
    }
}
// ----
// test() -> true
