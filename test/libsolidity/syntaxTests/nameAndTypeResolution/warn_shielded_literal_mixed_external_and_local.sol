// Mix of external call (context B: 5506) and local assignment (context C: 9660)
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
// Warning 5506: (258-270): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (292-305): Literals converted to shielded integers will leak during contract deployment.
