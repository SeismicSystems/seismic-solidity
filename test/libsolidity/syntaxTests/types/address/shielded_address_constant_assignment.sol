contract C {
    saddress constant a = saddress(0);
    saddress payable constant b = payable(0);
    function f() public {
        a = saddress(0);
        b = payable(0);
    }
}
// ----
// TypeError 6520: (132-133: Cannot assign to a constant variable.
// TypeError 6520: (157-158): Cannot assign to a constant variable.
