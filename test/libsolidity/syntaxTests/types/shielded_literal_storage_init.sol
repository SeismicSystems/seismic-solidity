contract C {
    // Storage variable initialization with shielded literals
    suint256 private x = 42s;
    suint8 private y = 255s;
    sint256 private z = -100s;
    sint8 private w = -128s;
}
// ----
// Warning 9660: (100-103): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (128-132): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (159-163): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (188-192): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
