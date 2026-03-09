contract C {
    suint8 private x;

    function test() internal {
        x = -1s;
    }
}
// ----
// Warning 9660: (80-82): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (79-82): Type shielded_int_const -1 is not implicitly convertible to expected type suint8. Cannot implicitly convert signed literal to unsigned type.
