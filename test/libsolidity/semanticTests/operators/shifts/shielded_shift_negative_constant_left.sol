// Adapted from: test/libsolidity/semanticTests/operators/shifts/shift_negative_constant_left.sol
contract C {
    sint256 private a = sint256(-0x42 << 8);
    function a_val() public returns (int256) {
        return int256(a);
    }
}
// ----
// a_val() -> -16896
