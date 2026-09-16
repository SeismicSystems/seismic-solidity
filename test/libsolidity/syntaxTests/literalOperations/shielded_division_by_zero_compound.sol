contract A {
    suint a = suint(5);
    constructor() { a /= suint(0); }
}
// ----
// Warning 10403: (27-35): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (62-70): Literals converted to shielded integers will leak during contract deployment.
