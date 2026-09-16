contract C {
    suint256 private x;

    function testPow() public returns (uint256) {
        x = 2s ** 8s;
        return uint(x);
    }

    function testPowZero() public returns (uint256) {
        x = 2s ** 0s;
        return uint(x);
    }

    function testPowOne() public returns (uint256) {
        x = 2s ** 1s;
        return uint(x);
    }

    function testPowLarge() public returns (uint256) {
        x = 10s ** 18s;
        return uint(x);
    }

    function testZeroPowZero() public returns (uint256) {
        x = 0s ** 0s;
        return uint(x);
    }
}
// ----
// testPow() -> 256
// testPowZero() -> 1
// testPowOne() -> 2
// testPowLarge() -> 1000000000000000000
// testZeroPowZero() -> 1
