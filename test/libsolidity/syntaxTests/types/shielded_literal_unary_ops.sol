contract C {
    sint256 private x;

    function test() internal {
        // Unary minus
        x = -42s;
        // Double negation
        x = -(-42s);
        // Triple negation
        x = -(-(-42s));
    }
}
// ----
// Warning 9660: (104-107): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (151-154): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (201-204): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
