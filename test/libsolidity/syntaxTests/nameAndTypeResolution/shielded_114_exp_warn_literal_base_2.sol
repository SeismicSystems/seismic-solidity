contract test {
    function f() pure public returns(uint) {
        suint8 x = suint8(100);
        return uint(suint8(10)**x);
    }
}
// ----
// Warning 9660: (80-91): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (113-123): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (113-126): Shielded integer exponentiation will leak the exponent value through gas cost.
