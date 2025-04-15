contract C {
    sint constant b = 3;
    sint immutable b2 = 3;
}
// ----
// DeclarationError 7491: (17-36): Shielded objects cannot be set to constant or immutable.
// DeclarationError 7491: (42-63): Shielded objects cannot be set to constant or immutable.
