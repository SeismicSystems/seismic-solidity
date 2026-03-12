contract C {
    suint256 private x;
    sint256 private y;

    constructor() {
        x = 42s;
        y = -100s;
    }
}
// ----
// Warning 9667: (93-96): Shielded number literals will leak during contract deployment.
// Warning 9667: (111-115): Shielded number literals will leak during contract deployment.
