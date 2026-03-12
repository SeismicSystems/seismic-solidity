// Public function called internally (no `.`) with shielded literal — SHOULD warn
contract C {
    suint256 private val;
    function setVal(suint256 x) public {
        val = x;
    }
    function test() external {
        setVal(suint256(42));
    }
}
// ----
// Warning 10403: (233-245): Literals converted to shielded integers will leak during contract deployment.
