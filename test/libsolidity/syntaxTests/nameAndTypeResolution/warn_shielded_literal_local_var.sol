// Local variable initialized from literal — SHOULD warn (literal in bytecode)
contract C {
    function test() external pure {
        suint256 x = suint256(42);
    }
}
// ----
// Warning 10403: (151-163): Literals converted to shielded integers will leak during contract deployment.
// Warning 2072: (138-148): Unused local variable.
