contract A {
    suint a = suint(5);
    constructor() { a %= suint(((2)*2)%4); }
}
// ----
// Warning 10403: (27-35): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (62-78): Literals converted to shielded integers will leak during contract deployment.
