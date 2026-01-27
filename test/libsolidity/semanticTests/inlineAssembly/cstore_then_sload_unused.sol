contract C {
    function test() external {
        assembly {
            cstore(5, 100)    // Make slot 5 private
            pop(sload(5))     // SLOAD result is unused (popped)
        }
    }
}
// ----
// test() -> FAILURE
