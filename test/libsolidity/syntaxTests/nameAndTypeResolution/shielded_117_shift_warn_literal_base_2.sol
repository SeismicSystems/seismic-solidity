contract test {
    function f() pure public returns(uint) {
        suint8 x = 100;
        return uint(suint8(10) << x);
    }
}
// ----
// Warning 9660: (69-83): Literals converted to shielded integers will leak during contract deployment.
