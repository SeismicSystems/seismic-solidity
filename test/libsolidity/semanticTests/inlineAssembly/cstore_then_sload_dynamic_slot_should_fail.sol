contract C {
    function test(uint slot) external returns (uint) {
        assembly {
            cstore(0, 42)
        }
        // Separate block to avoid compile-time detection.
        // When slot == 0, sload should revert because the slot is now private.
        assembly {
            let x := sload(slot)
            mstore(0, x)
            return(0, 32)
        }
    }
}
// ----
// test(uint256): 0 -> FAILURE
