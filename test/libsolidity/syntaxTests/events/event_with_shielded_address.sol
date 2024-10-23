contract C {
    event e(saddress indexed a);
    function f() public { emit e(saddress(this)); }
}
// ----
// TypeError 4626: (25-43): Shielded Types are not allowed as event parameter type.
