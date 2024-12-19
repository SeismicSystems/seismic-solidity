contract c {
    event e(saddress a, bytes32 s);
}
// ----
// TypeError 4626: (25-35): Shielded Types are not allowed as event parameter type.
