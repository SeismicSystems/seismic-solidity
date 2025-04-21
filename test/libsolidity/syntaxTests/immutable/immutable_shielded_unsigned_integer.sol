contract C {
    suint immutable b = 3;
}
// ----
// DeclarationError 7491: (17-38): Shielded objects cannot be set to constant or immutable.
