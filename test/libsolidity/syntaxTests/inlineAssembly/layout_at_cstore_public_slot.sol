// cstore on a public slot must be flagged (10314) even in a `layout at` contract, via a bare
// literal, a literal alias, or a .slot reference. baseSlot is resolved on-demand so the map is built.
contract C layout at 42 {
    uint256 public x;   // slot 42
    suint256 secret;    // slot 43
    function bypassLiteral() public { assembly { cstore(42, 1) } }
    function bypassAlias() public { assembly { let s := 42  cstore(s, 1) } }
    function viaSlot() public { assembly { cstore(x.slot, 1) } }
    function shieldedOk() public { assembly { cstore(secret.slot, 1) } }
}
// ====
// EVMVersion: >=mercury
// ----
// TypeError 10314: (342-355): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
// TypeError 10314: (420-432): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
// TypeError 10314: (480-497): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
