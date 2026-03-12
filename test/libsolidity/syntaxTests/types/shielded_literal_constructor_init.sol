contract C {
    suint256 private x;
    sint256 private y;

    constructor() {
        x = 42s;
        y = -100s;
    }
}
// ----
// Warning 9660: (93-96): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (111-115): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
