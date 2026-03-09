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
// Warning 9660: (124-126): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (129-131): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (168-171): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (174-177): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (217-219): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (222-224): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (258-261): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (264-266): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (298-301): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (304-306): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (346-348): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (352-354): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
