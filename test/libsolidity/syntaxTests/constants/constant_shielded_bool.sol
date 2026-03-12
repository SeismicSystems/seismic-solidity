contract C {
    sbool constant b = true;
}
// ----
// DeclarationError 10104: (17-40): Shielded objects cannot be set to constant or immutable.
