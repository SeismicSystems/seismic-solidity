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
// Warning 9660: (120-125): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (139-144): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (158-163): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (177-182): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
