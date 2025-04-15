contract C {
    saddress payable constant a = payable(0);
    saddress payable immutable b = payable(0);
}
// ----
// DeclarationError 7491: (17-57): Shielded objects cannot be set to constant or immutable.
// DeclarationError 7491: (63-104): Shielded objects cannot be set to constant or immutable.
