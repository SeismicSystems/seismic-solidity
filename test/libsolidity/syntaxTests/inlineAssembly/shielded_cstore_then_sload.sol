contract C {
    function test() external returns (uint256 r) {
        assembly {
            cstore(0, 1)
            r := sload(0)
        }
    }
}
// ----
// TypeError 5768: (125-133): Cannot use sload() on a slot that was previously written with cstore(). cstore() makes the slot private, and sload() cannot access private storage. Use cload() instead.
