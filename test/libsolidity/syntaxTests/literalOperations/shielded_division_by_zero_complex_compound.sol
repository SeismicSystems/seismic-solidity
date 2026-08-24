contract A {
    suint a;
    constructor() { a /= suint(((2)*2)%4); }
}
// ----
// Warning 10403: (51-67): Literals converted to shielded integers will leak during contract deployment.
