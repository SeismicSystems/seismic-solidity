contract C {
    suint256 private a;
    suint8 private b;
    sint256 private c;
    sint8 private d;

    function test() internal {
        // Zero shielded literal in various contexts
        a = 0s;
        b = 0s;
        c = 0s;
        d = 0s;
        // Zero in arithmetic
        a = 0s + 1s;
        a = 1s - 1s;
        a = 0s * 100s;
        // Hex zero
        a = 0x0s;
    }
}
// ----
// Warning 10416: (200-202): Shielded number literals will leak during contract deployment.
// Warning 10416: (216-218): Shielded number literals will leak during contract deployment.
// Warning 10416: (232-234): Shielded number literals will leak during contract deployment.
// Warning 10416: (248-250): Shielded number literals will leak during contract deployment.
// Warning 10416: (294-296): Shielded number literals will leak during contract deployment.
// Warning 10416: (299-301): Shielded number literals will leak during contract deployment.
// Warning 10416: (315-317): Shielded number literals will leak during contract deployment.
// Warning 10416: (320-322): Shielded number literals will leak during contract deployment.
// Warning 10416: (336-338): Shielded number literals will leak during contract deployment.
// Warning 10416: (341-345): Shielded number literals will leak during contract deployment.
// Warning 10416: (379-383): Shielded number literals will leak during contract deployment.
