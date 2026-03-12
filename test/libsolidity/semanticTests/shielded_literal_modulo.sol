contract C {
    suint256 private x;

    function testMod() public returns (uint256) {
        x = 10s % 3s;
        return uint(x);
    }

    function testModExact() public returns (uint256) {
        x = 9s % 3s;
        return uint(x);
    }

    function testModLarge() public returns (uint256) {
        x = 1000000s % 7s;
        return uint(x);
    }

    function testModOne() public returns (uint256) {
        x = 42s % 1s;
        return uint(x);
    }
}
// ----
// testMod() -> 1
// testModExact() -> 0
// testModLarge() -> 6
// testModOne() -> 0
