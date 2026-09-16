contract C {
    uint256 public x;
    function privatize(uint256 v) external {
        assembly { cstore(x.slot, v) }
    }
    function readOk() external view returns (uint256 r) {
        // cload is read-only and never claims the slot, so it is allowed on a public slot.
        assembly { r := cload(x.slot) }
    }
}
// ----
// TypeError 10314: (99-116): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
