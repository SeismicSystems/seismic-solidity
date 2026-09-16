contract C {
    sbool sa;
    sbool sb;
    sbool sc;
    function f() internal {
        sc = sa && sb;
        sc = sa || sb;
    }
}
// ----
// Warning 10316: (96-104): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10316: (119-127): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
