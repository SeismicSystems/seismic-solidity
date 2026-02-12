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
// Warning 9660: (91-99): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (101-109): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (113-121): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (123-131): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (223-231): Literals converted to shielded integers will leak during contract deployment.
