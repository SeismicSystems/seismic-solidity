contract test {
    function fun(suint256 a) public {
        suint256 x = suint(3) ** a;
    }
}
// ----
// Warning 9660: (75-83): Literals converted to shielded integers will leak during contract deployment.
// Warning 10304: (75-88): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 2072: (62-72): Unused local variable.
// Warning 2018: (20-95): Function state mutability can be restricted to pure
