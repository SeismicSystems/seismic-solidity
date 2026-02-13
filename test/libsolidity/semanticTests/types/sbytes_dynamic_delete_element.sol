// Tests deleting specific indices in a 100-element array
// Adapted from bytes_delete_element.sol
contract C {
    sbytes data;

    function test1() external returns (bool) {
        data = new sbytes(100);
        for (uint256 i = 0; i < 100; i++)
            data[i] = sbytes1(uint8(i));
        delete data[94];
        delete data[96];
        delete data[98];
        require(data[94] == sbytes1(0x00));
        require(data[95] == sbytes1(uint8(95)));
        require(data[96] == sbytes1(0x00));
        require(data[97] == sbytes1(uint8(97)));
        return true;
    }
}
// ----
// test1() -> true
