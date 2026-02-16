contract A {
    suint a;
    constructor() { a = suint(5); a %= suint(0); }
}
// ----
// Warning 9660: (50-58): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (65-73): Literals converted to shielded integers will leak during contract deployment.
