contract C {
    function test() external {
        assembly {
            cstore(0, 1)
        }
        // We put the following in a separate assembly block since the TypeChecker prevents
        // mixing sstore and cstore in the same block. Eventually our typechecker should get smarter
        // and also prevent mixing them across blocks when they access the same slot, but for now we
        // at least make sure that SSTORE results in runtime failure.
        assembly {
            sstore(0, 0x1337)
        }
    }
}
// ----
// test() -> FAILURE
