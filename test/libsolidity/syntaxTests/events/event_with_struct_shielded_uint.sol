contract C {
    struct S { suint a; }
    event e(S indexed a);
    function f() public { emit e(S); }
}
// ----
// TypeError 10107: (51-62): Shielded Types are not allowed as event parameter type.
