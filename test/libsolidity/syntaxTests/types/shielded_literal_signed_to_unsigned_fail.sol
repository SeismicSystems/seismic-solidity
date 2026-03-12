contract C {
    suint8 private a;
    suint16 private b;
    suint256 private c;

    function test() internal {
        // Negative shielded literal to unsigned should fail for all widths
        a = -1s;
        b = -1s;
        c = -1s;
        c = -100s;
    }
}
// ----
// Warning 9660: (203-205): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (202-205): Type shielded_int_const -1 is not implicitly convertible to expected type suint8. Cannot implicitly convert signed literal to unsigned type.
// Warning 9660: (220-222): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (219-222): Type shielded_int_const -1 is not implicitly convertible to expected type suint16. Cannot implicitly convert signed literal to unsigned type.
// Warning 9660: (237-239): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (236-239): Type shielded_int_const -1 is not implicitly convertible to expected type suint256. Cannot implicitly convert signed literal to unsigned type.
// Warning 9660: (254-258): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (253-258): Type shielded_int_const -100 is not implicitly convertible to expected type suint256. Cannot implicitly convert signed literal to unsigned type.
