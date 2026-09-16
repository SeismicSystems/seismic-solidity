// Tests string storage push via bytes cast for long strings
// Regression test for storageArrayPushFunction bug (affects isByteArrayOrString)
contract C {
    string data;

    function setup() public {
        // Create a 40-character string (long string encoding)
        data = "1234567890123456789012345678901234567890";
    }

    function pushChar(bytes1 b) public {
        bytes(data).push(b);
    }

    function getLength() public view returns (uint256) {
        return bytes(data).length;
    }

    function getChar(uint256 i) public view returns (bytes1) {
        return bytes(data)[i];
    }

    function getString() public view returns (string memory) {
        return data;
    }
}
// ----
// setup() ->
// getLength() -> 40
// getChar(uint256): 0 -> left(0x31)
// getChar(uint256): 39 -> left(0x30)
// pushChar(bytes1): left(0x41) ->
// getLength() -> 41
// getChar(uint256): 40 -> left(0x41)
// pushChar(bytes1): left(0x42) ->
// getLength() -> 42
// getChar(uint256): 41 -> left(0x42)
// pushChar(bytes1): left(0x43) ->
// getLength() -> 43
// getChar(uint256): 42 -> left(0x43)
