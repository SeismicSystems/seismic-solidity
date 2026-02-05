contract A {
    constructor() { suint a; a % suint(0); }
}
// ----
// Warning 4281: (42-54): Shielded integer modulo can leak information. A revert due to division by zero reveals that the divisor is zero.
