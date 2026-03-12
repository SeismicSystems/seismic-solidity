// Address literal cast through payable then to saddress — hits conversion error, not 10407
contract Child {
    saddress payable private addr;
    constructor(saddress payable _addr) { addr = _addr; }
}

contract Parent {
    function test() external {
        new Child(saddress(payable(0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF)));
    }
}
// ----
// Warning 10103: (156-178): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// TypeError 9553: (268-329): Invalid type for argument in function call. Invalid implicit conversion from saddress to saddress payable requested.
