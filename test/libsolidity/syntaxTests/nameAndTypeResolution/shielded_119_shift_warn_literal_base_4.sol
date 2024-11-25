contract test {
    function f() pure public returns(uint) {
         suint8 x = 100;
         return uint(10 >> x);
    }
}
// ----
// Warning 9660: (70-84): Literals converted to shielded integers will leak during contract deployment.
