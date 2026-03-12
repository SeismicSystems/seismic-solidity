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
// Warning 9667: (124-126): Shielded number literals will leak during contract deployment.
// Warning 9667: (129-131): Shielded number literals will leak during contract deployment.
// Warning 9667: (168-171): Shielded number literals will leak during contract deployment.
// Warning 9667: (174-177): Shielded number literals will leak during contract deployment.
// Warning 9667: (217-219): Shielded number literals will leak during contract deployment.
// Warning 9667: (222-224): Shielded number literals will leak during contract deployment.
// Warning 9667: (258-261): Shielded number literals will leak during contract deployment.
// Warning 9667: (264-266): Shielded number literals will leak during contract deployment.
// Warning 9667: (298-301): Shielded number literals will leak during contract deployment.
// Warning 9667: (304-306): Shielded number literals will leak during contract deployment.
// Warning 9667: (346-348): Shielded number literals will leak during contract deployment.
// Warning 9667: (352-354): Shielded number literals will leak during contract deployment.
