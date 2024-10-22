contract C {
    struct S { suint a; }
    error E(S);
}

// ----
// TypeError 4626: (51-52): Type containing a shielded integer is not allowed as error parameter type.
