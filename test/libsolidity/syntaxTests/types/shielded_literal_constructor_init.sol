contract C {
    suint256 private x;
    sint256 private y;

    constructor() {
        x = 42s;
        y = -100s;
    }
}
// ----
// Warning 10416: (93-96): Shielded number literals will leak during contract deployment.
// Warning 10416: (111-115): Shielded number literals will leak during contract deployment.
