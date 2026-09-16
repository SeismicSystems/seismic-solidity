// Tests bytes.push(value) functionality
// This test exposes a bug where sload was incorrectly used instead of sstore
// in the storageArrayPushFunction when pushing to a bytes array with >31 elements
contract C {
    bytes data;

    function pushByte(bytes1 b) public {
        data.push(b);
    }

    function getLength() public view returns (uint256) {
        return data.length;
    }

    function getByte(uint256 i) public view returns (bytes1) {
        return data[i];
    }

    // Push enough bytes to transition from short to long array (>31 bytes)
    function fillTo32() public {
        for (uint i = 0; i < 32; i++) {
            data.push(bytes1(uint8(i + 1)));
        }
    }

    function pushMultiple() public {
        data.push(0x01);
        data.push(0x02);
        data.push(0x03);
    }
}
// ----
// getLength() -> 0
// pushByte(bytes1): left(0x42) ->
// getLength() -> 1
// getByte(uint256): 0 -> left(0x42)
// pushMultiple() ->
// getLength() -> 4
// getByte(uint256): 1 -> left(0x01)
// getByte(uint256): 2 -> left(0x02)
// getByte(uint256): 3 -> left(0x03)
// fillTo32() ->
// getLength() -> 36
// getByte(uint256): 4 -> left(0x01)
// getByte(uint256): 35 -> left(0x20)
// pushByte(bytes1): left(0xAB) ->
// getLength() -> 37
// getByte(uint256): 36 -> left(0xAB)
