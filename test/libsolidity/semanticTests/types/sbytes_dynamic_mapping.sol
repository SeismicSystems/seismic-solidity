// Tests sbytes as mapping value: set, copy between keys, reset
// Adapted from bytes_inside_mappings.sol (msg.data and storageEmpty removed)
contract C {
    mapping(uint256 => sbytes) data;

    function set(uint256 key, uint256 len) public returns (bool) {
        delete data[key];
        for (uint256 i = 0; i < len; i++)
            data[key].push(sbytes1(uint8(i)));
        return true;
    }

    function copy(uint256 from, uint256 to) public returns (bool) {
        data[to] = data[from];
        return true;
    }

    function getLength(uint256 key) public returns (uint256) {
        return uint256(suint256(data[key].length));
    }

    function getValue(uint256 key, uint256 index) public returns (bytes1) {
        return bytes1(data[key][index]);
    }
}
// ----
// set(uint256,uint256): 1, 10 -> true
// set(uint256,uint256): 2, 40 -> true
// getLength(uint256): 1 -> 10
// getLength(uint256): 2 -> 40
// getValue(uint256,uint256): 1, 0 -> left(0x00)
// getValue(uint256,uint256): 2, 39 -> left(0x27)
// copy(uint256,uint256): 1, 2 -> true
// getLength(uint256): 2 -> 10
// copy(uint256,uint256): 99, 1 -> true
// getLength(uint256): 1 -> 0
// copy(uint256,uint256): 99, 2 -> true
// getLength(uint256): 2 -> 0
