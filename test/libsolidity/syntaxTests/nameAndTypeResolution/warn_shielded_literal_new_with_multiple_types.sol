// new expression with multiple shielded types — all SHOULD warn
contract Child {
    suint256 private a;
    sbool private b;
    constructor(suint256 _a, sbool _b) { a = _a; b = _b; }
}

contract Parent {
    function test() external {
        new Child(suint256(10), sbool(true));
    }
}
// ----
// Warning 10103: (145-156): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10103: (158-166): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 5501: (258-270): Literals converted to shielded integers will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
// Warning 5502: (272-283): Bool Literals converted to shielded bools will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
