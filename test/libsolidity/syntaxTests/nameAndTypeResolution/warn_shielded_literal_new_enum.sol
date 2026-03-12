// Enum value passed to constructor with suint256 param via new expression
enum Color { Red, Green, Blue }

contract Child {
    suint256 private val;
    constructor(suint256 _val) { val = _val; }
}

contract Parent {
    function test() external {
        new Child(suint256(Color.Red));
    }
}
// ----
// Warning 10103: (167-180): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10413: (268-287): Enums converted to shielded integers will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
