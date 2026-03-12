contract C {
    function f() public pure {
        sbool b = sbool(true);
        abi.encodePacked(b);
    }
}
// ----
// Warning 9661: (62-73): Bool Literals converted to shielded bools will leak during contract deployment.
// TypeError 10202: (100-101): Shielded types cannot be ABI encoded.
