contract test {
    function f() pure public returns(suint) {
        suint8 x = 100;
        return suint8(10)**x;
    }
}
// ----
// Warning 9660: (70-84): Literals converted to shielded integers will leak during contract deployment.
