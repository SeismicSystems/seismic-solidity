contract C {
    suint256 private x;
    suint8 private y;

    function test() internal {
        // Bitwise AND
        x = 0xFFs & 0x0Fs;
        // Bitwise OR
        x = 0xF0s | 0x0Fs;
        // Bitwise XOR
        x = 0xFFs ^ 0x0Fs;
        // Chained bitwise
        x = (0xFFs & 0xF0s) | 0x0Fs;
        // Bitwise on small types
        y = 0xF0s & 0x0Fs;
    }
}
// ----
// Warning 9660: (126-131): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (134-139): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (175-180): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (183-188): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (225-230): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (233-238): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (280-285): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (288-293): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (297-302): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (350-355): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (358-363): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
