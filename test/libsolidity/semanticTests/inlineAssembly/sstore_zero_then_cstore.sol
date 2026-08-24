contract C {
    function test() external returns (uint256) {
        assembly {
            sstore(5, 0)      // Clear slot 5 (public, value = 0)
            cstore(5, 100)    // Claim slot 5 for private use
        }
        // We put the following in a separate assembly block since the TypeChecker prevents
        // mixing sstore and cstore in the same block. Eventually our typechecker should get smarter
        // and also prevent mixing them across blocks when they access the same slot,
        // but for now we use this test to test the CSE eliminator and make sure SLOAD is left as is
        // to fail at runtime.
        assembly {
            let x := sload(5) // Should FAIL - slot is now private
            // Below is only there to make sure sload is not dropped as dead code
            mstore(0, x)
            return(0, 32)
        }
    }
}
// ----
// test() -> FAILURE
