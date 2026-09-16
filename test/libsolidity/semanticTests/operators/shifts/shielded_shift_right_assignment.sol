contract C {
    function f(suint256 a, suint256 b) public returns (uint256) {
        a >>= b;
        return uint256(a);
    }
}
// ----
// f(suint256,suint256): 0x4266, 0x0 -> 0x4266
// f(suint256,suint256): 0x4266, 0x8 -> 0x42
// f(suint256,suint256): 0x4266, 0x10 -> 0
// f(suint256,suint256): 0x4266, 0x11 -> 0
