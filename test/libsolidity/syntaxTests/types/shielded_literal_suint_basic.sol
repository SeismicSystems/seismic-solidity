contract C {
    suint8 private a;
    suint16 private b;
    suint32 private c;
    suint64 private d;
    suint128 private e;
    suint256 private f;

    function test() internal {
        a = 0s;
        a = 255s;
        b = 65535s;
        c = 0xDEADs;
        d = 1_000_000s;
        e = 1e10s;
        f = 0s;
    }
}
// ----
// Warning 9660: (196-198): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (212-216): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (230-236): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (250-257): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (271-281): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (295-300): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (314-316): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
