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
// Warning 10416: (126-131): Shielded number literals will leak during contract deployment.
// Warning 10416: (134-139): Shielded number literals will leak during contract deployment.
// Warning 10416: (175-180): Shielded number literals will leak during contract deployment.
// Warning 10416: (183-188): Shielded number literals will leak during contract deployment.
// Warning 10416: (225-230): Shielded number literals will leak during contract deployment.
// Warning 10416: (233-238): Shielded number literals will leak during contract deployment.
// Warning 10416: (280-285): Shielded number literals will leak during contract deployment.
// Warning 10416: (288-293): Shielded number literals will leak during contract deployment.
// Warning 10416: (297-302): Shielded number literals will leak during contract deployment.
// Warning 10416: (350-355): Shielded number literals will leak during contract deployment.
// Warning 10416: (358-363): Shielded number literals will leak during contract deployment.
