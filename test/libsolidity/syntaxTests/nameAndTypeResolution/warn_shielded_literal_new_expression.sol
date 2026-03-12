// new expression with shielded literal — SHOULD warn (literal in init code)
contract Child {
    suint256 private val;
    constructor(suint256 _val) { val = _val; }
}

contract Parent {
    function test() external {
        new Child(suint256(99));
    }
}
// ----
// Warning 10103: (138-151): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10401: (239-251): Literals converted to shielded integers will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
