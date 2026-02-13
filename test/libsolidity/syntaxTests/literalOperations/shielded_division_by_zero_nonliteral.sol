contract A {
    constructor() { suint a; a / suint(0); }
}
// ----
// Warning 9660: (46-54): Literals converted to shielded integers will leak during contract deployment.
