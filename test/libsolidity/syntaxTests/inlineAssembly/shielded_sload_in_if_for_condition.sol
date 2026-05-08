contract C {
    suint256 private secret;
    function f() external returns (uint256 result) {
        assembly {
            if sload(secret.slot) { result := 1 }
            for { } sload(secret.slot) { } { break }
        }
    }
}
// ----
// TypeError 10308: (123-141): Cannot use sload() on shielded storage variable. Use cload() instead.
// TypeError 10308: (175-193): Cannot use sload() on shielded storage variable. Use cload() instead.
