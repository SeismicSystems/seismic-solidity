contract test {
    function f() pure public returns(uint) {
         suint8 x = suint8(100);
         return uint(10 >> x);
    }
}
// ----
// Warning 10403: (81-92): Literals converted to shielded integers will leak during contract deployment.
