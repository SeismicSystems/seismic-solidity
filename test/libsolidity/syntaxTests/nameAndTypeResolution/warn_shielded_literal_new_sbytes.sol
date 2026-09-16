// FixedBytes literal passed to constructor with sbytes32 param via new expression
contract Child {
    sbytes32 private data;
    constructor(sbytes32 _data) { data = _data; }
}

contract Parent {
    function test() external {
        new Child(sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132));
    }
}
// ----
// Warning 10103: (143-157): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10410: (247-323): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
