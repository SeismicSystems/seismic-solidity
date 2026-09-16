contract c {
    event e(saddress a, bytes32 s);
}
// ----
// TypeError 10107: (25-35): Shielded Types are not allowed as event parameter type.
