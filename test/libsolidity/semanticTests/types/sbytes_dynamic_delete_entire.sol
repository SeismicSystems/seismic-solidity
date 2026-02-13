// Tests delete entire sbytes array for both short and long arrays
// Adapted from delete_bytes_array.sol and delete_removes_bytes_data.sol (assembly removed)
contract C {
    sbytes data;

    function test() public returns (bool) {
        // Push short data (2 elements)
        data.push(sbytes1(0x61));
        data.push(sbytes1(0x62));
        require(uint256(suint256(data.length)) == 2);

        delete data;
        require(uint256(suint256(data.length)) == 0);

        // Push long data (35 elements, crosses short/long boundary)
        for (uint256 i = 0; i < 35; i++)
            data.push(sbytes1(uint8(i)));
        require(uint256(suint256(data.length)) == 35);

        delete data;
        require(uint256(suint256(data.length)) == 0);

        return true;
    }
}
// ----
// test() -> true
