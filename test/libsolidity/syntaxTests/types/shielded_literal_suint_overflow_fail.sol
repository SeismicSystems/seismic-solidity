contract C {
    suint8 private a;
    suint16 private b;

    function test() internal {
        a = 256s;
        b = 65536s;
    }
}
// ----
// Warning 9660: (102-106): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (102-106): Type shielded_int_const 256 is not implicitly convertible to expected type suint8. Literal is too large to fit in suint8.
// Warning 9660: (120-126): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (120-126): Type shielded_int_const 65536 is not implicitly convertible to expected type suint16. Literal is too large to fit in suint16.
