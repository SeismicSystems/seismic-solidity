// Tests index access on sbytes calldata without storing
contract C {
    function getFirst(sbytes calldata data) external returns (bool) {
        require(data[0] == sbytes1(0x41));
        return true;
    }

    function getLast(sbytes calldata data) external returns (bool) {
        require(data[uint256(suint256(data.length)) - 1] == sbytes1(0x43));
        return true;
    }

    function getAt(sbytes calldata data, uint256 i) external returns (bool) {
        require(data[i] == sbytes1(0x42));
        return true;
    }
}
// ----
// getFirst(sbytes): 0x20, 3, 0x4142430000000000000000000000000000000000000000000000000000000000 -> true
// getLast(sbytes): 0x20, 3, 0x4142430000000000000000000000000000000000000000000000000000000000 -> true
// getAt(sbytes,uint256): 0x40, 1, 3, 0x4142430000000000000000000000000000000000000000000000000000000000 -> true
