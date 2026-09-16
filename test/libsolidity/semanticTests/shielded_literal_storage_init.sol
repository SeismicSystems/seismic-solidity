contract C {
    suint256 private x = 42s;
    suint8 private y = 255s;
    sint256 private z = -100s;

    function getX() public returns (uint256) {
        return uint(x);
    }

    function getY() public returns (uint256) {
        return uint(uint8(y));
    }

    function getZ() public returns (int256) {
        return int(z);
    }
}
// ----
// getX() -> 42
// getY() -> 255
// getZ() -> -100
