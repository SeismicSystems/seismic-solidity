// Tests that bytes.push(value) correctly updates length for long arrays
// Regression test: sload was used instead of sstore, failing to update length
contract C {
    bytes data;

    function setup() public {
        // Create a 64-byte array (well into long array territory)
        for (uint i = 0; i < 64; i++) {
            data.push(bytes1(uint8(i)));
        }
    }

    function pushAndReturnLength(bytes1 b) public returns (uint256) {
        data.push(b);
        return data.length;
    }

    function getLength() public view returns (uint256) {
        return data.length;
    }

    function getByte(uint256 i) public view returns (bytes1) {
        return data[i];
    }
}
// ----
// setup() ->
// getLength() -> 64
// pushAndReturnLength(bytes1): left(0xFF) -> 65
// getLength() -> 65
// getByte(uint256): 64 -> left(0xFF)
// pushAndReturnLength(bytes1): left(0xFE) -> 66
// getLength() -> 66
// getByte(uint256): 65 -> left(0xFE)
// pushAndReturnLength(bytes1): left(0xFD) -> 67
// getLength() -> 67
// getByte(uint256): 66 -> left(0xFD)
