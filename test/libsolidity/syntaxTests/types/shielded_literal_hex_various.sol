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
// Warning 9660: (190-195): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (209-214): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (228-233): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (247-254): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (268-279): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (293-312): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (354-358): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (394-401): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
