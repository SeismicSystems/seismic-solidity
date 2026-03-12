contract C {
    sbool immutable b = true;
}
// ----
// DeclarationError 10104: (17-41): Shielded objects cannot be set to constant or immutable.
