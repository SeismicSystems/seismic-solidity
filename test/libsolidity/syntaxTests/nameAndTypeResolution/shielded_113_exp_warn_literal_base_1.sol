contract test {
    function f() pure public returns(uint) {
        suint8 x = suint8(100);
        return uint(10**x);
    }
}
// ----
// Warning 9660: (80-91): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (113-118): Shielded integer exponentiation will leak the exponent value through gas cost.
