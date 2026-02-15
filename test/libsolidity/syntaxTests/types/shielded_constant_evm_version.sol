contract C {
    suint256 constant X = suint256(100);
}
// ====
// EVMVersion: =paris
// compileViaYul: true
// ----
// DeclarationError 7491: (20-48): Shielded objects cannot be set to constant or immutable.
