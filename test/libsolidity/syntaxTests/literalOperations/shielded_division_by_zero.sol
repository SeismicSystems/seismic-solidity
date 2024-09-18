contract C {
    suint constant a = 1 / 0;
}
// ----
// DeclarationError 7491: (17-41): Shielded integers cannot be set to constant.
