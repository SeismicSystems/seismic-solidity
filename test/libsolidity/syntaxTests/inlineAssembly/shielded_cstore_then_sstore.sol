contract C {
    function test() external {
        assembly {
            cstore(0, 1)
            sstore(0, 0x1337)
        }
    }
}
// ----
// TypeError 10309: (100-117): Cannot use sstore() on a slot that was previously written with cstore(). cstore() makes the slot private, and sstore() cannot access private storage. Use cstore() instead.
