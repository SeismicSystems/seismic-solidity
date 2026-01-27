contract C {
    function test() external returns (uint256) {
        assembly {
            cstore(5, 100)    // Make slot 5 private
            let x := sload(5) // Should HALT - slot is now private
            mstore(0, x)
            return(0, 32)
        }
    }
}
// ----
// test() -> FAILURE
