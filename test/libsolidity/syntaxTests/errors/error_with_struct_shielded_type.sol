contract C {
    struct S { suint a; }
    error E(S);
}

// ----
// TypeError 4626: (51-52): Shielded Types are not allowed as error parameter type.
