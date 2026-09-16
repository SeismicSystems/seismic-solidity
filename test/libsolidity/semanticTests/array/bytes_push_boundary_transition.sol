// Tests bytes.push() around the short/long array boundary (31 bytes)
// Regression test for storageArrayPushFunction bug
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

    // Fill to exactly 30 bytes (still short array)
    function fillTo30() public {
        for (uint i = 0; i < 30; i++) {
            data.push(bytes1(uint8(0x10 + i)));
        }
    }
}
// ----
// getLength() -> 0
// fillTo30() ->
// getLength() -> 30
// getByte(uint256): 0 -> left(0x10)
// getByte(uint256): 29 -> left(0x2d)
// pushByte(bytes1): left(0xE1) ->
// getLength() -> 31
// getByte(uint256): 30 -> left(0xE1)
// pushByte(bytes1): left(0xE2) ->
// getLength() -> 32
// getByte(uint256): 31 -> left(0xE2)
// pushByte(bytes1): left(0xE3) ->
// getLength() -> 33
// getByte(uint256): 32 -> left(0xE3)
// pushByte(bytes1): left(0xE4) ->
// getLength() -> 34
// getByte(uint256): 33 -> left(0xE4)
