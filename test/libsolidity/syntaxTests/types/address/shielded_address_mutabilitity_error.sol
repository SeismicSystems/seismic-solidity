contract C {
    saddress constant a = saddress(0);
    saddress payable constant b = payable(0);
    saddress immutable c = saddress(0);
    saddress payable immutable d = payable(0);
    function f() public pure returns (address, address) {
        return (address(a),address(b));
    }
}
// ----
// DeclarationError 7491: (17-50): Shielded objects cannot be set to constant or immutable.
// DeclarationError 7491: (56-96): Shielded objects cannot be set to constant or immutable.
// DeclarationError 7491: (102-136): Shielded objects cannot be set to constant or immutable.
// DeclarationError 7491: (142-183): Shielded objects cannot be set to constant or immutable.
