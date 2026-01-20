contract C {
    function test() external {
        assembly {
            cstore(0, 1)
            sstore(0, 0x1337)
        }
    }
}
// ----
// test() -> FAILURE
