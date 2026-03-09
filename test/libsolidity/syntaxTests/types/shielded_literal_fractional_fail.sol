contract C {
    suint256 private x;

    function test() internal {
        x = 1.5s;
    }
}
// ----
// Warning 9660: (81-85): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 2326: (81-85): Type shielded_rational_const 3 / 2 is not implicitly convertible to expected type suint256. Try converting to type ufixed8x1 or use an explicit conversion.
