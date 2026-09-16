// A `layout at N` contract with inline assembly must not crash the shielded-storage-op check
// (its layout base is evaluated after type checking, so the slot map is not yet available).
// The literal-slot cstore guard is skipped for such a contract; the direct .slot check still works.
contract C layout at 42 {
    uint256 public x;
    suint256 secret;
    function okSstore() public { assembly { sstore(x.slot, 16) } }
    function okCstoreShielded() public { assembly { cstore(secret.slot, 1) } }
    function badCstorePublic() public { assembly { cstore(x.slot, 1) } }
}
// ----
// TypeError 10314: (554-571): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
