// abi.encodeCall with shielded suint256 argument
contract Target {
    function setVal(suint256 x) external {}
}

contract Caller {
    Target t;
    function test() external view {
        abi.encodeCall(t.setVal, (suint256(42)));
    }
}
// ----
// Warning 10403: (217-229): Literals converted to shielded integers will leak during contract deployment.
// TypeError 10203: (216-230): Shielded types cannot be ABI encoded.
