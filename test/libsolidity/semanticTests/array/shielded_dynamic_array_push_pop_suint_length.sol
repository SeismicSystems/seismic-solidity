// Tests push/pop with suint256 length and verifies casts
contract C {
    suint[] data;

    function pushAndGetLength(uint256 val) public returns (uint256) {
        data.push(suint(val));
        return uint256(data.length);
    }

    function popAndGetLength() public returns (uint256) {
        data.pop();
        return uint256(data.length);
    }

    function verifyLengthIsSuint(uint256 expected) public view returns (bool) {
        return bool(data.length == suint(expected));
    }
}
// ----
// pushAndGetLength(uint256): 10 -> 1
// pushAndGetLength(uint256): 20 -> 2
// pushAndGetLength(uint256): 30 -> 3
// verifyLengthIsSuint(uint256): 3 -> true
// popAndGetLength() -> 2
// popAndGetLength() -> 1
// verifyLengthIsSuint(uint256): 1 -> true
