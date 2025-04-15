contract C {
    sbool immutable b = true;
}
// ----
// DeclarationError 7491: (17-41): Shielded objects cannot be set to constant or immutable.
