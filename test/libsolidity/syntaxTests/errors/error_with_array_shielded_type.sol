contract C {
    error E(suint[], suint[1]);
}

// ----
// TypeError 4626: (25-32): Type containing a shielded integer is not allowed as error parameter type.
