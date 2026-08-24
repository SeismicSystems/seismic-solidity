contract C {
    function f() public pure {
        suint256 a = suint256(1);
        abi.encodeWithSelector(bytes4(0x12345678), a);
    }
}
// ----
// Warning 10403: (65-76): Literals converted to shielded integers will leak during contract deployment.
// TypeError 10202: (129-130): Shielded types cannot be ABI encoded.
