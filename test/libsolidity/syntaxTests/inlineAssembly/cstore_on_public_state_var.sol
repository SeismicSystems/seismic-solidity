contract C {
    uint256 public x;
    function privatize(uint256 v) external {
        assembly { cstore(x.slot, v) }
    }
    function leak() external view returns (uint256 r) {
        assembly { r := cload(x.slot) }
    }
}
// ----
// TypeError 10314: (90-105): Cannot use cstore() on non-shielded storage variable. Use sstore() instead.
// TypeError 10314: (192-202): Cannot use cload() on non-shielded storage variable. Use sload() instead.
