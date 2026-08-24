// New test: sint type conversions (sign extension, truncation, sint<->int)
contract C {
    function signExtension() public pure returns (int256) {
        sint8 small = sint8(-1);
        sint256 big = sint256(small);
        return int256(big);
    }

    function truncation() public pure returns (int8) {
        sint256 big = sint256(-1);
        sint8 small = sint8(big);
        return int8(small);
    }

    function truncationLoss() public pure returns (int8) {
        sint256 big = sint256(-257);
        sint8 small = sint8(big);
        // -257 truncated to sint8: -257 & 0xFF = 0xFF = -1 in int8
        return int8(small);
    }

    function sintToInt() public pure returns (int256) {
        sint256 s = sint256(-42);
        int256 i = int256(s);
        return i;
    }

    function intToSint() public pure returns (int256) {
        int256 i = -42;
        sint256 s = sint256(i);
        return int256(s);
    }

    function roundTrip() public pure returns (bool) {
        sint256 original = sint256(-123456789);
        int256 intermediate = int256(original);
        sint256 back = sint256(intermediate);
        return bool(back == original);
    }
}
// ----
// signExtension() -> -1
// truncation() -> -1
// truncationLoss() -> -1
// sintToInt() -> -42
// intToSint() -> -42
// roundTrip() -> true
