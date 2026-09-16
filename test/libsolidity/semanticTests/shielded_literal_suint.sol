contract C {
    suint256 private x;
    suint8 private y;

    function setAndGet() public returns (uint256, uint256) {
        x = 42s;
        y = 255s;
        return (uint(x), uint(y));
    }

    function arithmetic() public returns (uint256) {
        x = 10s + 20s;
        return uint(x);
    }

    function hexLiteral() public returns (uint256) {
        x = 0xDEADs;
        return uint(x);
    }

    function underscoreLiteral() public returns (uint256) {
        x = 1_000s;
        return uint(x);
    }

    function scientificLiteral() public returns (uint256) {
        x = 1e5s;
        return uint(x);
    }

    function zero() public returns (uint256) {
        x = 0s;
        return uint(x);
    }
}
// ----
// setAndGet() -> 42, 255
// arithmetic() -> 30
// hexLiteral() -> 0xDEAD
// underscoreLiteral() -> 1000
// scientificLiteral() -> 100000
// zero() -> 0
