contract C {
    // Storage variable initialization with shielded literals
    suint256 private x = 42s;
    suint8 private y = 255s;
    sint256 private z = -100s;
    sint8 private w = -128s;
}
// ----
// Warning 10416: (100-103): Shielded number literals will leak during contract deployment.
// Warning 10416: (128-132): Shielded number literals will leak during contract deployment.
// Warning 10416: (159-163): Shielded number literals will leak during contract deployment.
// Warning 10416: (188-192): Shielded number literals will leak during contract deployment.
