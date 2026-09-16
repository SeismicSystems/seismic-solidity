// Constructor body with shielded literal — SHOULD warn (literal in init code)
contract C {
    suint256 private val;
    constructor() {
        val = suint256(55);
    }
}
// ----
// Warning 10403: (154-166): Literals converted to shielded integers will leak during contract deployment.
