// External call with sbool literal — emits context B warning (10405)
contract Target {
    function setVal(sbool x) external {}
}

contract Caller {
    Target t;
    function test() external {
        t.setVal(sbool(true));
    }
}
// ----
// Warning 10405: (213-224): Bool Literals converted to shielded bools will leak during contract deployment.
