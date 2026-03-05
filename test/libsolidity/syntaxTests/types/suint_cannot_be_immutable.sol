contract C {
    suint256 immutable x;

    constructor() {
        x = suint256(42);
    }
}
// ----
// DeclarationError 7491: (17-37): Shielded objects cannot be set to constant or immutable.
