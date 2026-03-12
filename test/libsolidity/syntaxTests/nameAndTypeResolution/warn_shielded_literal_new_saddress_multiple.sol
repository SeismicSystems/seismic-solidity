// Multiple address literals passed to constructor with saddress params via new expression
contract Child {
    saddress private a;
    saddress private b;
    constructor(saddress _a, saddress _b) { a = _a; b = _b; }
}

contract Parent {
    function test() external {
        new Child(
            saddress(0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF),
            saddress(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)
        );
    }
}
// ----
// Warning 10103: (172-183): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10103: (185-196): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10407: (301-353): Address Literals converted to shielded addresses will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
// Warning 10407: (367-419): Address Literals converted to shielded addresses will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
