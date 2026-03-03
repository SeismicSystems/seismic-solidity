// Tests bytes.push(value) for long arrays (>31 bytes)
// Regression test for bug where sload was used instead of sstore
// and storeValue was missing template brackets in storageArrayPushFunction
contract C {
    bytes data;

    // Fill array to exactly 32 bytes (transition to long array encoding)
    function setup() public {
        for (uint i = 0; i < 32; i++) {
            data.push(bytes1(uint8(i)));
        }
    }

    // Push to long array - this exercises the buggy code path
    function pushToLongArray(bytes1 b) public {
        data.push(b);
    }

    function getLength() public view returns (uint256) {
        return data.length;
    }

    function getByte(uint256 i) public view returns (bytes1) {
        return data[i];
    }
}
// ----
// getLength() -> 0
// setup() ->
// getLength() -> 32
// getByte(uint256): 0 -> left(0x00)
// getByte(uint256): 31 -> left(0x1f)
// pushToLongArray(bytes1): left(0xAA) ->
// getLength() -> 33
// getByte(uint256): 32 -> left(0xAA)
// pushToLongArray(bytes1): left(0xBB) ->
// getLength() -> 34
// getByte(uint256): 33 -> left(0xBB)
// pushToLongArray(bytes1): left(0xCC) ->
// getLength() -> 35
// getByte(uint256): 34 -> left(0xCC)
