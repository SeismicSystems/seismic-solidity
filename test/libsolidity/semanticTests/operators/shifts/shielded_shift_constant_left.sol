contract C {
    suint256 private a = suint256(0x42 << 8);
    function a_val() public returns (uint256) {
        return uint256(a);
    }
}
// ----
// a_val() -> 0x4200
