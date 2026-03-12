contract C {
    // Shielded types cannot be immutable
    suint256 private immutable X = 42s;
}
// ----
// DeclarationError 7491: (59-93): Shielded objects cannot be set to constant or immutable.
