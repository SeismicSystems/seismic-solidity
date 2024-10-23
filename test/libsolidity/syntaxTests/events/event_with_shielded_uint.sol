contract C {
    event e(suint indexed a);
    function f() public { emit e(suint(2)); }
}
// ----
// TypeError 4626: (25-40): Shielded Types are not allowed as event parameter type.
