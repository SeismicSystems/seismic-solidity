contract C {
    suint256 private x;

    function testIfElse() public returns (uint256) {
        x = 10s;
        if (x == 10s) {
            x = 20s;
        } else {
            x = 30s;
        }
        return uint(x);
    }

    function testTernary(bool cond) public returns (uint256) {
        x = cond ? 100s : 200s;
        return uint(x);
    }

    function testLoop() public returns (uint256) {
        x = 0s;
        for (suint256 i = 0s; i < 5s; i = i + 1s) {
            x = x + 10s;
        }
        return uint(x);
    }
}
// ----
// testIfElse() -> 20
// testTernary(bool): true -> 100
// testTernary(bool): false -> 200
// testLoop() -> 50
