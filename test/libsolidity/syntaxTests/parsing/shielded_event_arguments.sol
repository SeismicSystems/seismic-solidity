contract c {
    event e(suint a, bytes32 s);
}
// ----
// TypeError 4626: (25-32): Type containing a shielded integer is not allowed as event parameter type.

