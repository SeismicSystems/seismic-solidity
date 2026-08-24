contract C {
    function f() public pure {
        suint256 a = suint256(1);
        abi.encodeWithSignature("foo(uint256)", a);
    }
}
// ----
// Warning 10403: (65-76): Literals converted to shielded integers will leak during contract deployment.
// TypeError 10202: (126-127): Shielded types cannot be ABI encoded.
