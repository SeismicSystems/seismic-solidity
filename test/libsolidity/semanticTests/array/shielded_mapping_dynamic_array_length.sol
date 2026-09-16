// Tests mapping of dynamic shielded arrays with shielded length
contract C {
    mapping(uint => suint[]) data;

    function push(uint key, uint256 val) public {
        data[key].push(suint(val));
    }

    function getLength(uint key) public view returns (uint256) {
        return uint256(data[key].length);
    }

    function getValue(uint key, uint256 idx) public view returns (uint256) {
        return uint256(data[key][idx]);
    }
}
// ----
// getLength(uint256): 0 -> 0
// push(uint256,uint256): 0, 42 ->
// getLength(uint256): 0 -> 1
// getValue(uint256,uint256): 0, 0 -> 42
// push(uint256,uint256): 0, 43 ->
// getLength(uint256): 0 -> 2
// getValue(uint256,uint256): 0, 1 -> 43
// getLength(uint256): 1 -> 0
// push(uint256,uint256): 1, 99 ->
// getLength(uint256): 1 -> 1
