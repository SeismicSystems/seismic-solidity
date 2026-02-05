contract C {
    function f() public pure {
        sbool b = sbool(true);
        abi.encodePacked(b);
    }
}
// ----
// Warning 9661: (52-73): Bool Literals converted to shielded bools will leak during contract deployment.
// TypeError 3648: (100-101): Shielded types cannot be ABI encoded.
