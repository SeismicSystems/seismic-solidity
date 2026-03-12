contract C {
    sint constant b = 3;
}
// ----
// DeclarationError 10104: (17-36): Shielded objects cannot be set to constant or immutable.
