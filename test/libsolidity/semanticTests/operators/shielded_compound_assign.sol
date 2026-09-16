contract test {
    suint value1;
    suint value2;
    function f(suint256 x, suint256 y) public returns (uint w) {
        suint value3 = y;
        value1 += x;
        value3 *= x;
        value2 *= value3 + value1;
        value2 += suint(7);
        return uint(value2);
    }
}
// ----
// f(suint256,suint256): 0, 6 -> 7
// f(suint256,suint256): 1, 3 -> 0x23
// f(suint256,suint256): 2, 25 -> 0x0746
// f(suint256,suint256): 3, 69 -> 396613
// f(suint256,suint256): 4, 84 -> 137228105
// f(suint256,suint256): 5, 2 -> 0xcc7c5e28
// f(suint256,suint256): 6, 51 -> 1121839760671
// f(suint256,suint256): 7, 48 -> 408349672884251
