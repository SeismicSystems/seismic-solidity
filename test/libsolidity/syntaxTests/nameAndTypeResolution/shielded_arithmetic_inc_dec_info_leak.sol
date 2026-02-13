contract C {
    function f() public pure {
        suint256 a = suint256(1);
        a++;
        a--;
        ++a;
        --a;
    }
}
// ----
// Warning 9660: (65-76): Literals converted to shielded integers will leak during contract deployment.
