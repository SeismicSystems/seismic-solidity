contract c {
    event e(sbool a, bytes32 s);
}
// ----
// TypeError 4626: (25-32): Shielded Types are not allowed as event parameter type.

