contract C {
    function f(suint256 a, suint256 b) public returns (uint256) {
        return uint256(a << b);
    }
}
// ----
// f(suint256,suint256): 0x4266, 0x0 -> 0x4266
// f(suint256,suint256): 0x4266, 0x8 -> 0x426600
// f(suint256,suint256): 0x4266, 0x10 -> 0x42660000
// f(suint256,suint256): 0x4266, 0x11 -> 0x84cc0000
// f(suint256,suint256): 0x4266, 0xf0 -> 0x4266000000000000000000000000000000000000000000000000000000000000
// f(suint256,suint256): 0x4266, 0x100 -> 0
