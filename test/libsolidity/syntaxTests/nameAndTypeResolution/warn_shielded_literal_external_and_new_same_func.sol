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
// Warning 5500: (148-159): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 5506: (323-335): Literals converted to shielded integers will leak during contract deployment.
// Warning 5501: (356-368): Literals converted to shielded integers will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
