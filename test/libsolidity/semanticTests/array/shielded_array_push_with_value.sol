// Tests shielded array push with value functionality
// This test verifies that storageArrayPushFunction uses cstore for shielded types
contract C {
    suint[] data;

    function pushValue(uint256 v) public {
        data.push(suint256(v));
    }

    function getLength() public view returns (uint256) {
        return data.length;
    }

    function getValue(uint256 i) public view returns (uint256) {
        return uint256(data[i]);
    }

    function pushMultiple() public {
        data.push(suint256(100));
        data.push(suint256(200));
        data.push(suint256(300));
    }
}
// ----
// getLength() -> 0
// pushValue(uint256): 42 ->
// getLength() -> 1
// getValue(uint256): 0 -> 42
// pushMultiple() ->
// getLength() -> 4
// getValue(uint256): 1 -> 100
// getValue(uint256): 2 -> 200
// getValue(uint256): 3 -> 300
