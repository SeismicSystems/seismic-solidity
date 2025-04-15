contract C {
    sbool constant b = true;
    sbool immutable b2 = true;
}
// ----
// DeclarationError 7491: (17-40): Shielded objects cannot be set to constant or immutable.
// DeclarationError 7491: (46-71): Shielded objects cannot be set to constant or immutable.
