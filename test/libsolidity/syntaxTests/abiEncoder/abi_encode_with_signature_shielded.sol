contract C {
    function f() public pure {
        suint256 a = suint256(1);
        abi.encodeWithSignature("foo(uint256)", a);
    }
}
// ----
// Warning 9660: (52-76): Literals converted to shielded integers will leak during contract deployment.
// TypeError 3648: (126-127): Shielded types cannot be ABI encoded.
