// Multiple enum values passed to constructor with suint params via new expression
enum Status { Pending, Active, Closed }

contract Child {
    suint256 private a;
    suint256 private b;
    constructor(suint256 _a, suint256 _b) { a = _a; b = _b; }
}

contract Parent {
    function test() external {
        new Child(suint256(Status.Active), suint256(Status.Closed));
    }
}
// ----
// Warning 10103: (205-216): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10103: (218-229): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10413: (321-344): Enums converted to shielded integers will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
// Warning 10413: (346-369): Enums converted to shielded integers will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
