contract C {
    sbool immutable b = true;
}
// ----
// DeclarationError 7491: (17-40): Shielded objects cannot be set to constant or immutable.