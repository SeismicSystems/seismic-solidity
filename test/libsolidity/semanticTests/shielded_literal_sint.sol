contract C {
    sint256 private x;
    sint8 private y;

    function setNegative() public returns (int256) {
        x = -42s;
        return int(x);
    }

    function setPositive() public returns (int256) {
        x = 100s;
        return int(x);
    }

    function setSmallNegative() public returns (int256) {
        y = -128s;
        return int(int8(y));
    }

    function setSmallPositive() public returns (int256) {
        y = 127s;
        return int(int8(y));
    }

    function negativeArithmetic() public returns (int256) {
        x = -10s + -20s;
        return int(x);
    }
}
// ----
// setNegative() -> -42
// setPositive() -> 100
// setSmallNegative() -> -128
// setSmallPositive() -> 127
// negativeArithmetic() -> -30
