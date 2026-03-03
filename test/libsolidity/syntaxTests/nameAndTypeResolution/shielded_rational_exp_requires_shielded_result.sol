contract test {
    function f() pure internal returns(suint256) {
        suint8 x = suint8(2);
        suint256 result = 10 ** x;  // Should work: rational ** shielded -> shielded
        return result;
    }
}
// ----
// Warning 9660: (86-95): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (123-130): Shielded integer exponentiation will leak the exponent value through gas cost.
