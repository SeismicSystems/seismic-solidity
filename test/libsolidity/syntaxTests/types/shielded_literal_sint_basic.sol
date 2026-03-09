contract C {
    sint8 private a;
    sint16 private b;
    sint32 private c;
    sint64 private d;
    sint128 private e;
    sint256 private f;

    function test() internal {
        a = 0s;
        a = 127s;
        a = -128s;
        a = -1s;
        b = -32768s;
        c = -0xDEADs;
        d = -1_000_000s;
        e = -1e10s;
        f = 0s;
    }
}
// ----
// Warning 9660: (190-192): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (206-210): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (225-229): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (244-246): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (261-267): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (282-289): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (304-314): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (329-334): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (348-350): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
