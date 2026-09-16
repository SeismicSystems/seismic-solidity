contract C {
    event e(suint indexed a);
    function f() public { emit e(suint(2)); }
}
// ----
// TypeError 10107: (25-40): Shielded Types are not allowed as event parameter type.
