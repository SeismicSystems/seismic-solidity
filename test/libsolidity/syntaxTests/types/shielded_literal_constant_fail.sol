contract C {
    // Shielded types cannot be constant
    suint256 private constant X = 42s;
}
// ----
// DeclarationError 10104: (58-91): Shielded objects cannot be set to constant or immutable.
