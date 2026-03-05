// Tests that copying empty sbytes over non-empty clears the data
// Adapted from copy_removes_bytes_data.sol (msg.data and storageEmpty removed)
contract C {
    sbytes data1;
    sbytes data2;

    function set() public returns (bool) {
        for (uint256 i = 0; i < 100; i++)
            data1.push(sbytes1(uint8(i)));
        return true;
    }

    function reset() public returns (bool) {
        data1 = data2;
        return true;
    }

    function verify() public returns (bool) {
        require(uint256(suint256(data1.length)) == 0);
        return true;
    }

    function verifyNonEmpty() public returns (bool) {
        require(uint256(suint256(data1.length)) > 0);
        return true;
    }
}
// ----
// set() -> true
// verifyNonEmpty() -> true
// reset() -> true
// verify() -> true
