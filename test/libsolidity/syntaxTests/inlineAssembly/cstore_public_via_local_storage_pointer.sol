contract Q {
    struct S { uint256 v; }
    S public x;
    function test() public {
        S storage ptr = x;
        assembly { cstore(ptr.slot, 99) }
    }
}
// ----
// TypeError 10314: (132-152): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
