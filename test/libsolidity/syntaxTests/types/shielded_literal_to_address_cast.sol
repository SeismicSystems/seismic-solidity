// Bug: address(42s) should be blocked since shielded literals can't convert to non-shielded types
contract C {
    function test() internal {
        // Explicit cast of shielded literal to address
        address a = address(42s);
        // Explicit cast of shielded literal to saddress
        saddress b = saddress(42s);
    }
}
// ----
// Warning 9660: (227-230): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (320-323): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 2072: (207-216): Unused local variable.
// Warning 2072: (298-308): Unused local variable.
// Warning 2018: (116-331): Function state mutability can be restricted to pure
