contract C {
    function f() public pure {
        suint256 a = suint256(1);
        abi.encode(a);
    }
}
// ----
// Warning 10403: (65-76): Literals converted to shielded integers will leak during contract deployment.
// TypeError 10202: (97-98): Shielded types cannot be ABI encoded.
