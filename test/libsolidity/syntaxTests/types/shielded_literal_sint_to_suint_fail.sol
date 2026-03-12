contract C {
    suint256 private x;
    sint256 private y;

    function test() internal {
        // Negative shielded literal should not fit in unsigned shielded type
        x = -1s;
        // But positive shielded literal should fit in signed type
        y = 42s;
    }
}
// ----
// Warning 9660: (183-185): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (182-185): Type shielded_int_const -1 is not implicitly convertible to expected type suint256. Cannot implicitly convert signed literal to unsigned type.
// Warning 9660: (266-269): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
