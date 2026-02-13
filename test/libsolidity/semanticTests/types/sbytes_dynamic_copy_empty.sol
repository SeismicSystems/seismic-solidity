// Tests that copying empty sbytes and pushing produces zeroed element
// Adapted from empty_bytes_copy.sol (calldata and assembly removed)
contract C {
    sbytes data;
    sbytes otherData;

    function fromMemory() public returns (bool) {
        sbytes memory t = new sbytes(0);
        data = t;
        data.push();
        require(data[0] == sbytes1(0x00));
        return true;
    }

    function fromStorage() public returns (bool) {
        // otherData is empty by default
        data = otherData;
        data.push();
        require(data[0] == sbytes1(0x00));
        return true;
    }
}
// ----
// fromMemory() -> true
// fromStorage() -> true
