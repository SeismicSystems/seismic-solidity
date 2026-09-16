contract C {
    suint256 private x;

    function testTrue() public returns (uint256) {
        x = true ? 42s : 0s;
        return uint(x);
    }

    function testFalse() public returns (uint256) {
        x = false ? 42s : 99s;
        return uint(x);
    }

    function testDynamic(bool cond) public returns (uint256) {
        x = cond ? 1s : 2s;
        return uint(x);
    }
}
// ----
// testTrue() -> 42
// testFalse() -> 99
// testDynamic(bool): true -> 1
// testDynamic(bool): false -> 2
