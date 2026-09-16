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
// TypeError 10308: (129-147): Cannot use sload() on shielded storage variable. Use cload() instead.
// TypeError 10308: (184-202): Cannot use sload() on shielded storage variable. Use cload() instead.
