contract c {
    event e(suint a, bytes32 indexed s, bool indexed b);
}
// ----
// TypeError 4626: (25-32): Shielded Types are not allowed as event parameter type.
