contract C {
    function f() public pure {
        suint256 a = suint256(1);
        abi.encode(a);
    }
}
// ----
// Warning 9660: (65-76): Literals converted to shielded integers will leak during contract deployment.
// TypeError 3648: (97-98): Shielded types cannot be ABI encoded.
