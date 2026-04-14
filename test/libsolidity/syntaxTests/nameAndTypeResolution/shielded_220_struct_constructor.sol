contract C {
    struct S { suint256 a; sbool x; }
    function f() public {
        S memory s = S(suint256(1), sbool(true));
    }
}
// ----
// Warning 10403: (100-111): Literals converted to shielded integers will leak during contract deployment.
// Warning 10406: (113-124): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 2072: (85-95): Unused local variable.
// Warning 2018: (55-132): Function state mutability can be restricted to pure
