// Ternary with shielded literal — SHOULD warn (literal in bytecode regardless of branch)
contract C {
    suint256 private val;
    function test(bool cond) external {
        val = cond ? suint256(1) : suint256(2);
    }
}
// ----
// Warning 9660: (192-203): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (206-217): Literals converted to shielded integers will leak during contract deployment.
