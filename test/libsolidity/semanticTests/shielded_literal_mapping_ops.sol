contract C {
    mapping(uint256 => suint256) private m;

    function testSet() public returns (uint256) {
        m[0] = 42s;
        return uint(m[0]);
    }

    function testMultiple() public returns (uint256, uint256, uint256) {
        m[0] = 100s;
        m[1] = 200s;
        m[2] = 0xDEADs;
        return (uint(m[0]), uint(m[1]), uint(m[2]));
    }

    function testOverwrite() public returns (uint256) {
        m[0] = 42s;
        m[0] = 99s;
        return uint(m[0]);
    }

    function testZero() public returns (uint256) {
        m[0] = 42s;
        m[0] = 0s;
        return uint(m[0]);
    }
}
// ----
// testSet() -> 42
// testMultiple() -> 100, 200, 0xDEAD
// testOverwrite() -> 99
// testZero() -> 0
