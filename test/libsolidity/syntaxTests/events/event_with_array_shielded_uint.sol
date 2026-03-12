contract C {
    event e(suint[1]);
    function f() public { emit e([suint(1)]); }
}
// ----
// TypeError 10107: (25-33): Shielded Types are not allowed as event parameter type.
