contract C {
    suint8 private a;
    suint256 private b;

    function test() internal {
        // Same shielded literal fitting different types
        a = 100s;
        b = 100s;
        // Arithmetic result fitting different types
        a = 2s * 50s;
        b = 2s * 50s;
    }
}
// ----
// Warning 9660: (160-164): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (178-182): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (249-251): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (254-257): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (271-273): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (276-279): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
