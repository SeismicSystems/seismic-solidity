contract C {
    suint256 constant X = suint256(100);
}
// ----
// DeclarationError 10104: (17-52): Shielded objects cannot be set to constant or immutable.
