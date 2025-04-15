contract C {
    suint constant b = 3;
    suint immutable b2 = 3;
}
// ----
// DeclarationError 7491: (17-37): Shielded objects cannot be set to constant or immutable.
// DeclarationError 7491: (43-65): Shielded objects cannot be set to constant or immutable.
