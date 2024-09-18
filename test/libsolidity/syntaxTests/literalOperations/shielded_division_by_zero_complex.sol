contract C {
    suint constant a = 1 / ((1+3)-4);
}
// ----
// DeclarationError 7491: (17-49): Shielded integers cannot be set to constant.
