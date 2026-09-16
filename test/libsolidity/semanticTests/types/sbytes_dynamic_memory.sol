contract C {
    function testAllocLength() public pure returns (uint256) {
        sbytes memory x = new sbytes(35);
        return uint256(suint256(x.length));
    }

    function testZeroLength() public pure returns (uint256) {
        sbytes memory empty = new sbytes(0);
        return uint256(suint256(empty.length));
    }
}
// ----
// testAllocLength() -> 35
// testZeroLength() -> 0
