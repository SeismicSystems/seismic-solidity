contract C {
    function f() public pure {
        saddress a = saddress(0);
        abi.encode(a);
    }
}
// ----
// TypeError 3648: (97-98): Shielded types cannot be ABI encoded.
