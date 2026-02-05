contract C {
    function f(bytes memory data) public pure {
        abi.decode(data, (sbool));
    }
}
// ----
// TypeError 4851: (87-92): Shielded types cannot be ABI encoded.
