// Struct with shielded field in constant — should error
contract C {
    struct S {
        suint256 x;
    }
    function f() public pure {
        S memory s;
        s.x = suint256(1);
    }
}
// ----
// Warning 10403: (178-189): Literals converted to shielded integers will leak during contract deployment.
