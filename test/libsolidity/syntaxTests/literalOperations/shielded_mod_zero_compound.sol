contract A {
    suint a;
    constructor() { a = suint(5); a %= suint(0); }
}
// ----
// Warning 10403: (50-58): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (65-73): Literals converted to shielded integers will leak during contract deployment.
