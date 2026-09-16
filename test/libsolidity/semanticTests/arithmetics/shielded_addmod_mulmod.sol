contract C {
    function test() public returns (uint256) {
        suint256 a = suint256(2**255);
        if ((2**255 + 2**255) % 7 != addmod(uint256(a), uint256(a), 7)) return 1;
        if ((2**255 + 2**255) % 7 != addmod(uint256(a), uint256(a), 7)) return 2;
        return 0;
    }
}
// ----
// test() -> 0
