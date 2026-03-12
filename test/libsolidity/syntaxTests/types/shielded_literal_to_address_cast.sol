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
// Warning 10416: (227-230): Shielded number literals will leak during contract deployment.
// Warning 10416: (320-323): Shielded number literals will leak during contract deployment.
// Warning 2072: (207-216): Unused local variable.
// Warning 2072: (298-308): Unused local variable.
// Warning 2018: (116-331): Function state mutability can be restricted to pure
