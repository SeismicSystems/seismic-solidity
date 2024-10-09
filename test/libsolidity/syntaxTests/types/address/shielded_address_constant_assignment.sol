contract C {
    saddress constant a = saddress(0);
    saddress payable constant b = payable(0);
    function f() public {
        a = saddress(0);
        b = payable(0);
    }
}
// ----
// DeclarationError 7491: (17-50): Shielded objects cannot be set to constant.
// DeclarationError 7491: (56-96): Shielded objects cannot be set to constant.
