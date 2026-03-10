contract C {
    function f(sint256 a, suint256 b) public returns (int256) {
        a >>= b;
        return int256(a);
    }
}
// ----
// f(sint256,suint256): -4266, 0 -> -4266
// f(sint256,suint256): -4266, 1 -> -2133
// f(sint256,suint256): -4266, 4 -> -267
// f(sint256,suint256): -4266, 8 -> -17
// f(sint256,suint256): -4266, 16 -> -1
// f(sint256,suint256): -4266, 17 -> -1
// f(sint256,suint256): -4267, 0 -> -4267
// f(sint256,suint256): -4267, 1 -> -2134
// f(sint256,suint256): -4267, 4 -> -267
// f(sint256,suint256): -4267, 8 -> -17
// f(sint256,suint256): -4267, 16 -> -1
// f(sint256,suint256): -4267, 17 -> -1
