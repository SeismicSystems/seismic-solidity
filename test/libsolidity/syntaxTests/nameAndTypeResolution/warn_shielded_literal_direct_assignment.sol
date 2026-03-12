// Direct assignment of literal to shielded var — SHOULD warn (literal in bytecode)
contract C {
    suint256 private myVal;
    function test() external {
        myVal = suint256(100);
    }
}
// ----
// Warning 10403: (174-187): Literals converted to shielded integers will leak during contract deployment.
