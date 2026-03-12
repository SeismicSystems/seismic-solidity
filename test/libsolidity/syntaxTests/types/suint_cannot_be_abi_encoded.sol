contract C {
    function test() internal pure {
        suint256 x = suint256(1);
        abi.encode(x);
    }
}
// ----
// Warning 9660: (70-81): Literals converted to shielded integers will leak during contract deployment.
// TypeError 10202: (102-103): Shielded types cannot be ABI encoded.
