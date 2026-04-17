contract C {
    saddress constant X = saddress(address(0));
}
// ----
// DeclarationError 10104: (17-59): Shielded objects cannot be set to constant or immutable.
