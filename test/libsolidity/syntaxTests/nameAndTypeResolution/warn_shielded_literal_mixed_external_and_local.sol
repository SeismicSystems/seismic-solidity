// Mix of external call (context B: 10402) and local assignment (context C: 10403)
contract Target {
    function setVal(suint256 x) external {}
}

contract Caller {
    Target t;
    suint256 private localVal;

    function test() external {
        t.setVal(suint256(42));
        localVal = suint256(100);
    }
}
// ----
// Warning 10402: (258-270): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (292-305): Literals converted to shielded integers will leak during contract deployment.
