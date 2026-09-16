contract C {
    function test() internal pure {
        saddress x = saddress(address(1));
        abi.encode(x);
    }
}
// ----
// TypeError 10202: (111-112): Shielded types cannot be ABI encoded.
