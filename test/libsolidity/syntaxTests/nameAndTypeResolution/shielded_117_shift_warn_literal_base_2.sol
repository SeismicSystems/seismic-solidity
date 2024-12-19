contract test {
    function f() pure public returns(uint) {
        suint8 x = suint8(100);
        return uint(suint8(10) << x);
    }
}
// ----
// Warning 9660: (69-91): Literals converted to shielded integers will leak during contract deployment.
