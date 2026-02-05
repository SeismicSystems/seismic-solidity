contract C {
    function f(bytes memory data) public pure {
        abi.decode(data, (saddress));
    }
}
// ----
// TypeError 4851: (87-95): Shielded types cannot be ABI encoded.
