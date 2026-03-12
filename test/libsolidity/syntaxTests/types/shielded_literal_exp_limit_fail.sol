contract C {
    suint256 private x;

    function test() internal {
        // Exponentiation resulting in value too large
        x = 2s ** 256s;
    }
}
// ----
// Warning 9660: (136-138): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (142-146): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (136-146): Type shielded_int_const 1157...(70 digits omitted)...9936 is not implicitly convertible to expected type suint256. Literal is too large to fit in suint256.
