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
// Warning 10416: (196-198): Shielded number literals will leak during contract deployment.
// Warning 10416: (212-216): Shielded number literals will leak during contract deployment.
// Warning 10416: (230-236): Shielded number literals will leak during contract deployment.
// Warning 10416: (250-257): Shielded number literals will leak during contract deployment.
// Warning 10416: (271-281): Shielded number literals will leak during contract deployment.
// Warning 10416: (295-300): Shielded number literals will leak during contract deployment.
// Warning 10416: (314-316): Shielded number literals will leak during contract deployment.
