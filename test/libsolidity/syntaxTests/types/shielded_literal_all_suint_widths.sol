contract C {
    suint8 private a;
    suint16 private b;
    suint32 private c;
    suint64 private d;
    suint128 private e;
    suint256 private f;

    function test() internal {
        // Test max value for each width
        a = 255s;
        b = 65535s;
        c = 4294967295s;
        d = 18446744073709551615s;
        e = 340282366920938463463374607431768211455s;
        f = 115792089237316195423570985008687907853269984665640564039457584007913129639935s;
    }
}
// ----
// Warning 9660: (237-241): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (255-261): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (275-286): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (300-321): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (335-375): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (389-468): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
