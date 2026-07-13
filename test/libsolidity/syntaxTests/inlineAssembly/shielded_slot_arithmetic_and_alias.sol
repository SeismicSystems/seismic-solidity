contract C {
    suint256 secret;
    function viaComputedSlot() external view returns (uint256 r) {
        assembly { r := sload(add(secret.slot, 0)) }
    }
    function viaAlias() external view returns (uint256 r) {
        assembly { let s := secret.slot r := sload(s) }
    }
}
// ----
// TypeError 10308: (125-151): Cannot use sload() on shielded storage variable. Use cload() instead.
// TypeError 10308: (265-273): Cannot use sload() on shielded storage variable. Use cload() instead.
