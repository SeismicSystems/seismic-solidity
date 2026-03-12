contract C {
    // Storage variable initialization with shielded literals
    suint256 private x = 42s;
    suint8 private y = 255s;
    sint256 private z = -100s;
    sint8 private w = -128s;
}
// ----
// Warning 9667: (100-103): Shielded number literals will leak during contract deployment.
// Warning 9667: (128-132): Shielded number literals will leak during contract deployment.
// Warning 9667: (159-163): Shielded number literals will leak during contract deployment.
// Warning 9667: (188-192): Shielded number literals will leak during contract deployment.
