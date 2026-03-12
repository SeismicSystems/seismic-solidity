contract C {
    suint256 private a;
    suint8 private b;
    sint256 private c;
    sint8 private d;

    function test() internal {
        // Zero shielded literal in various contexts
        a = 0s;
        b = 0s;
        c = 0s;
        d = 0s;
        // Zero in arithmetic
        a = 0s + 1s;
        a = 1s - 1s;
        a = 0s * 100s;
        // Hex zero
        a = 0x0s;
    }
}
// ----
// Warning 9660: (200-202): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (216-218): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (232-234): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (248-250): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (294-296): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (299-301): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (315-317): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (320-322): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (336-338): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (341-345): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (379-383): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
