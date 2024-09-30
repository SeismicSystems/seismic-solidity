contract test {
    function fun(suint256 a) public {
        suint256 x = 3 ** a;
    }
}
// ----
// Warning 3817: (75-81): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 2072: (62-72): Unused local variable.
// Warning 2018: (20-88): Function state mutability can be restricted to pure
