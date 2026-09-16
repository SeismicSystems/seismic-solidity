contract C {
    suint256 private secret;
    function viaSwitch() external view {
        assembly { switch sload(secret.slot) case 0 {} }
    }
    function viaNestedInCondition() external view {
        assembly { if iszero(sload(secret.slot)) {} }
    }
    function viaNestedInValue() external view returns (uint256 r) {
        assembly { r := add(sload(secret.slot), 1) }
    }
}
// ----
// TypeError 10308: (109-127): Cannot use sload() on shielded storage variable. Use cload() instead.
// TypeError 10308: (227-245): Cannot use sload() on shielded storage variable. Use cload() instead.
// TypeError 10308: (354-372): Cannot use sload() on shielded storage variable. Use cload() instead.
