contract test {
    function f() pure public returns(uint) {
        suint8 x = 100;
        return uint(10**x);
    }
}
// ----
// Warning 9660: (69-83): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (105-110): Shielded integer exponentiation will leak the exponent value through gas cost.
