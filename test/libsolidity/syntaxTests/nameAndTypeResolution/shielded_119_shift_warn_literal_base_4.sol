contract test {
    function f() pure public returns(suint) {
         suint8 x = 100;
         return 10 >> x;
    }
}
// ----
// Warning 9660: (71-85): Literals converted to shielded integers will leak during contract deployment.
