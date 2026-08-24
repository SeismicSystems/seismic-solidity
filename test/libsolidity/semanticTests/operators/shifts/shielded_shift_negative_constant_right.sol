// Adapted from: test/libsolidity/semanticTests/operators/shifts/shift_negative_constant_right.sol
contract C {
    sint256 private a = sint256(-0x4200 >> 8);
    function a_val() public returns (int256) {
        return int256(a);
    }
}
// ----
// a_val() -> -66
