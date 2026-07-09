contract test {
    function f() pure public returns(uint) {
        suint8 x = suint8(100);
        return uint(10 << x);
    }
}
// ----
// Warning 10403: (80-91): Literals converted to shielded integers will leak during contract deployment.
// Warning 10313: (108-121): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
