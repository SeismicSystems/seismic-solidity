contract C {
    suint8 private a;
    sint8 private b;

    function test() internal {
        // Bitwise NOT on shielded literal
        a = ~0s;
        b = ~0s;
    }
}
// ----
// Warning 9660: (144-146): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (143-146): Type shielded_int_const -1 is not implicitly convertible to expected type suint8. Cannot implicitly convert signed literal to unsigned type.
// Warning 9660: (161-163): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
