contract C {
    suint8 private a;

    function test() internal {
        // Hex values at suint8 boundary
        a = 0x00s;
        a = 0x7Fs;
        a = 0x80s;
        a = 0xFFs;
    }
}
// ----
// Warning 9667: (120-125): Shielded number literals will leak during contract deployment.
// Warning 9667: (139-144): Shielded number literals will leak during contract deployment.
// Warning 9667: (158-163): Shielded number literals will leak during contract deployment.
// Warning 9667: (177-182): Shielded number literals will leak during contract deployment.
