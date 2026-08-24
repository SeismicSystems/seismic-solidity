contract A {
    constructor() { suint a; a / suint(0); }
}
// ----
// Warning 10403: (46-54): Literals converted to shielded integers will leak during contract deployment.
// Warning 10303: (42-54): Shielded integer division can leak information. A revert due to division by zero reveals that the divisor is zero.
