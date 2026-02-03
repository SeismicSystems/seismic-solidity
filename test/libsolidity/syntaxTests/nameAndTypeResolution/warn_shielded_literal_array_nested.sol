contract C {
    constructor() {
        // Nested arrays
        suint[2][2] memory a = [[suint(1), suint(2)], [suint(3), suint(4)]];
        // Array in struct
        // Single element array
        suint[1] memory b = [suint(5)];
        b[0] = a[0][0]; // Use the variables
    }
}
// ----
// Warning 9660: (66-133): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (66-133): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (66-133): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (66-133): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (202-232): Literals converted to shielded integers will leak during contract deployment.
