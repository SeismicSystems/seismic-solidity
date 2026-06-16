contract C {
    uint256 pub;
    suint256 secret;

    // cload never claims a slot -> allowed on a public slot.
    function cloadOk() external view returns (uint256 r) {
        assembly { r := cload(pub.slot) }
    }
    // cstore via a bare literal slot number that lands on a public state var.
    function cstoreLiteral() external {
        assembly { cstore(0, 1) }
    }
    // cstore via a yul local copied from a public .slot.
    function cstoreCopiedVar() external {
        assembly { let s := pub.slot  cstore(s, 1) }
    }
    // cstore on a genuinely shielded slot stays allowed.
    function cstoreShieldedOk() external {
        assembly { cstore(secret.slot, 1) }
    }
}
// ----
// TypeError 10314: (359-371): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
// TypeError 10314: (518-530): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
