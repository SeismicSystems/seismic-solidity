contract c {
    event e(sbool a, bytes32 s);
}
// ----
// TypeError 10107: (25-32): Shielded Types are not allowed as event parameter type.

