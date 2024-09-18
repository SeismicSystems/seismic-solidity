contract C {
    suint constant b3 = 1 % 0;
}
// ----
// DeclarationError 7491: (17-42): Shielded integers cannot be set to constant.
