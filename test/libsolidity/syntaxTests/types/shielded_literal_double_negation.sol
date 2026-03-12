contract C {
    suint256 private x;
    sint256 private y;

    function test() internal {
        // Double negation
        y = -(-42s);
        // Should be equivalent to positive
        x = -(-42s);
    }
}
// ----
// Warning 9660: (134-137): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (199-202): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
