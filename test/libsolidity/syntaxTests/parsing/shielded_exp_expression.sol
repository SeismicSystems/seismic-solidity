contract test {
    function fun(suint256 a) public {
        suint256 x = suint(3) ** a;
    }
}
// ----
// Warning 3817: (75-88): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 2072: (62-72): Unused local variable.
// Warning 2018: (20-95): Function state mutability can be restricted to pure
