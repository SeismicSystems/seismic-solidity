contract C {
    function f() public returns (uint256) {
        suint256 a = suint256(0x42);
        a <<= suint256(8);
        return uint256(a);
    }
}
// ----
// f() -> 0x4200
