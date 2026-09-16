contract C {
    suint256 private x;
    sint256 private y;

    function test() internal {
        // Addition
        x = 1s + 2s;
        // Subtraction
        y = 10s - 20s;
        // Multiplication
        x = 3s * 4s;
        // Division
        x = 10s / 2s;
        // Modulo
        x = 10s % 3s;
        // Exponentiation
        x = 2s ** 8s;
    }
}
// ----
// Warning 10416: (124-126): Shielded number literals will leak during contract deployment.
// Warning 10416: (129-131): Shielded number literals will leak during contract deployment.
// Warning 10416: (168-171): Shielded number literals will leak during contract deployment.
// Warning 10416: (174-177): Shielded number literals will leak during contract deployment.
// Warning 10416: (217-219): Shielded number literals will leak during contract deployment.
// Warning 10416: (222-224): Shielded number literals will leak during contract deployment.
// Warning 10416: (258-261): Shielded number literals will leak during contract deployment.
// Warning 10416: (264-266): Shielded number literals will leak during contract deployment.
// Warning 10416: (298-301): Shielded number literals will leak during contract deployment.
// Warning 10416: (304-306): Shielded number literals will leak during contract deployment.
// Warning 10416: (346-348): Shielded number literals will leak during contract deployment.
// Warning 10416: (352-354): Shielded number literals will leak during contract deployment.
