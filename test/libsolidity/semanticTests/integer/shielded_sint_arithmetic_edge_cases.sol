contract C {
    function mulOverflow() public returns (bool) {
        sint8 a = type(sint8).min;
        sint8 b = sint8(-1);
        // -128 * -1 = 128, which overflows sint8
        bool failed = false;
        try this.doMul8(a, b) {
        } catch {
            failed = true;
        }
        return failed;
    }

    function doMul8(sint8 a, sint8 b) external pure returns (int8) {
        return int8(a * b);
    }

    function divOverflow() public returns (bool) {
        sint8 a = sint8(-128);
        sint8 b = sint8(-1);
        // -128 / -1 = 128, which overflows sint8
        bool failed = false;
        try this.doDiv8(a, b) {
        } catch {
            failed = true;
        }
        return failed;
    }

    function doDiv8(sint8 a, sint8 b) external pure returns (int8) {
        return int8(a / b);
    }

    function subOverflow() public returns (bool) {
        sint256 a = sint256(0);
        sint256 b = type(sint256).min;
        // 0 - type(sint256).min overflows
        bool failed = false;
        try this.doSub256(a, b) {
        } catch {
            failed = true;
        }
        return failed;
    }

    function doSub256(sint256 a, sint256 b) external pure returns (int256) {
        return int256(a - b);
    }

    function negNegIsPositive() public pure returns (int256) {
        sint256 a = sint256(-7);
        sint256 b = sint256(-3);
        return int256(a * b);
    }

    function negPosIsNegative() public pure returns (int256) {
        sint256 a = sint256(-7);
        sint256 b = sint256(3);
        return int256(a * b);
    }
}
// ----
// mulOverflow() -> true
// divOverflow() -> true
// subOverflow() -> true
// negNegIsPositive() -> 21
// negPosIsNegative() -> -21
