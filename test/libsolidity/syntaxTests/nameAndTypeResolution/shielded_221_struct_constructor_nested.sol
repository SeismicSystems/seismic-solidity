contract C {
    struct X { suint256 x1; suint256 x2; }
    struct S { suint256 s1; suint256[3] s2; X s3; }
    function f() public {
        suint256[3] memory s2;
        S memory s = S(suint256(1), s2, X(suint256(4), suint256(5)));
    }
}
// ----
// Warning 10403: (188-199): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (207-218): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (220-231): Literals converted to shielded integers will leak during contract deployment.
// Warning 2072: (173-183): Unused local variable.
// Warning 2018: (112-240): Function state mutability can be restricted to pure
