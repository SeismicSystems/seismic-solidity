contract C {
    saddress immutable x;

    constructor() {
        x = saddress(address(42));
    }
}
// ----
// DeclarationError 10104: (17-37): Shielded objects cannot be set to constant or immutable.
