contract C {
    struct S { suint256 a; sbool x; }
    function f() public {
        S memory s = S({a: suint256(1), x: sbool(true)});
    }
}
// ----
// Warning 10403: (104-115): Literals converted to shielded integers will leak during contract deployment.
// Warning 10406: (120-131): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 2072: (85-95): Unused local variable.
// Warning 2018: (55-140): Function state mutability can be restricted to pure
