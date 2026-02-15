contract C {
    suint256 immutable x;

    constructor() {
        x = suint256(42);
    }
}
// ====
// EVMVersion: =cancun
// compileViaYul: true
// ----
// DeclarationError 7491: (20-40): Shielded objects cannot be set to constant or immutable.
