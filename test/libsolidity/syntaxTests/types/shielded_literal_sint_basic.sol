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
// Warning 9667: (190-192): Shielded number literals will leak during contract deployment.
// Warning 9667: (206-210): Shielded number literals will leak during contract deployment.
// Warning 9667: (225-229): Shielded number literals will leak during contract deployment.
// Warning 9667: (244-246): Shielded number literals will leak during contract deployment.
// Warning 9667: (261-267): Shielded number literals will leak during contract deployment.
// Warning 9667: (282-289): Shielded number literals will leak during contract deployment.
// Warning 9667: (304-314): Shielded number literals will leak during contract deployment.
// Warning 9667: (329-334): Shielded number literals will leak during contract deployment.
// Warning 9667: (348-350): Shielded number literals will leak during contract deployment.
