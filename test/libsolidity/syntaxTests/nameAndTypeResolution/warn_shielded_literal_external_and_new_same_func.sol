// External call (context B: 10402) and new expression (context A: 10401) in same function
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
// Warning 10103: (148-159): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10402: (323-335): Literals converted to shielded integers will leak during contract deployment.
// Warning 10401: (356-368): Literals converted to shielded integers will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
