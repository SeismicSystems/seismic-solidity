// FixedBytes literal passed to constructor with sbytes4 param via new expression
contract Child {
    sbytes4 private data;
    constructor(sbytes4 _data) { data = _data; }
}

contract Parent {
    function test() external {
        new Child(sbytes4(0x01020304));
    }
}
// ----
// Warning 10103: (141-154): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10410: (244-263): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment. Contract creation (CREATE/CREATE2) does not encrypt calldata. This is expected to be fixed in a future release.
