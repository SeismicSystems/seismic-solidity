contract C {
    // loop-condition sload conflicts with a body cstore across iterations (was a false negative)
    function conditionConflict(uint256 x) external {
        assembly { for {} gt(sload(0), 5) {} { cstore(0, x) } }
    }
    // pre-block runs once, so its sload does not conflict with a body cstore (was a false positive)
    function preNoConflict(uint256 n, uint256 x) external returns (uint256 r) {
        assembly { for { r := sload(1) } lt(r, n) {} { cstore(1, x) } }
    }
}
// ----
// TypeError 10309: (193-201): Cannot use sload() on a slot that was previously written with cstore(). cstore() makes the slot private, and sload() cannot access private storage. Use cload() instead.
