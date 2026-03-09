// External call (context B: 5506) and new expression (context A: 5501) in same function
contract Child {
    suint256 private val;
    constructor(suint256 _v) { val = _v; }
}

contract Target {
    function setVal(suint256 x) external {}
}

contract Caller {
    Target t;
    function test() external {
        t.setVal(suint256(42));
        new Child(suint256(99));
    }
}
// ----
// Warning 5506: (323-335): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (356-368): Literals converted to shielded integers will leak during contract deployment.
