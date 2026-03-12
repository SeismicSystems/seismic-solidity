contract C {
    suint immutable b = 3;
}
// ----
// DeclarationError 10104: (17-38): Shielded objects cannot be set to constant or immutable.
