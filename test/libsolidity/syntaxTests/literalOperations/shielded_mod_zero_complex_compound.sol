contract A {
    suint a = suint(5);
    constructor() { a %= suint(((2)*2)%4); }
}
// ----
// Warning 9660: (27-35): Literals converted to shielded integers will leak during contract deployment.
