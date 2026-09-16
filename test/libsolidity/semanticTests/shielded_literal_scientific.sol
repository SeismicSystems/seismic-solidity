contract C {
    suint256 private x;

    function testE0() public returns (uint256) {
        x = 1e0s;
        return uint(x);
    }

    function testE1() public returns (uint256) {
        x = 1e1s;
        return uint(x);
    }

    function testE18() public returns (uint256) {
        x = 1e18s;
        return uint(x);
    }

    function testCoefficient() public returns (uint256) {
        x = 5e3s;
        return uint(x);
    }
}
// ----
// testE0() -> 1
// testE1() -> 10
// testE18() -> 1000000000000000000
// testCoefficient() -> 5000
