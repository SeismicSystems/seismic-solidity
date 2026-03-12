contract C {
    suint8 private a;
    suint16 private b;
    suint32 private c;
    suint256 private d;

    function test() internal {
        // Various hex shielded literals
        a = 0x00s;
        a = 0xffs;
        a = 0xFFs;
        b = 0xABCDs;
        c = 0xDEADBEEFs;
        d = 0x1234567890ABCDEFs;
        // Single hex digit
        a = 0x1s;
        // Mixed case
        b = 0xAbCds;
    }
}
// ----
// Warning 9667: (190-195): Shielded number literals will leak during contract deployment.
// Warning 9667: (209-214): Shielded number literals will leak during contract deployment.
// Warning 9667: (228-233): Shielded number literals will leak during contract deployment.
// Warning 9667: (247-254): Shielded number literals will leak during contract deployment.
// Warning 9667: (268-279): Shielded number literals will leak during contract deployment.
// Warning 9667: (293-312): Shielded number literals will leak during contract deployment.
// Warning 9667: (354-358): Shielded number literals will leak during contract deployment.
// Warning 9667: (394-401): Shielded number literals will leak during contract deployment.
