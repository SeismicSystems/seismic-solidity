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
// Warning 9667: (237-241): Shielded number literals will leak during contract deployment.
// Warning 9667: (255-261): Shielded number literals will leak during contract deployment.
// Warning 9667: (275-286): Shielded number literals will leak during contract deployment.
// Warning 9667: (300-321): Shielded number literals will leak during contract deployment.
// Warning 9667: (335-375): Shielded number literals will leak during contract deployment.
// Warning 9667: (389-468): Shielded number literals will leak during contract deployment.
