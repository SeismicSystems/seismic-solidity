// abi.encodeCall with shielded sbool argument
contract Target {
    function setFlag(sbool x) external {}
}

contract Caller {
    Target t;
    function test() external view {
        abi.encodeCall(t.setFlag, (sbool(true)));
    }
}
// ----
// Warning 10406: (213-224): Bool Literals converted to shielded bools will leak during contract deployment.
// TypeError 10203: (212-225): Shielded types cannot be ABI encoded.
