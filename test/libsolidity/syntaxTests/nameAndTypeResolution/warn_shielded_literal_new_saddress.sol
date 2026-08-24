// Address literal passed to constructor with saddress param via new expression
contract Child {
    saddress private addr;
    constructor(saddress _addr) { addr = _addr; }
}

contract Parent {
    function test() external {
        new Child(saddress(0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF));
    }
}
// ----
// Warning 10103: (140-154): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10407: (244-296): Address Literals converted to shielded addresses will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
