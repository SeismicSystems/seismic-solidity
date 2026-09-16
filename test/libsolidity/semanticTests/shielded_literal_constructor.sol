contract C {
    suint256 private x;
    sint256 private y;

    constructor() {
        x = 42s;
        y = -100s;
    }

    function getX() public returns (uint256) {
        return uint(x);
    }

    function getY() public returns (int256) {
        return int(y);
    }
}
// ----
// getX() -> 42
// getY() -> -100
