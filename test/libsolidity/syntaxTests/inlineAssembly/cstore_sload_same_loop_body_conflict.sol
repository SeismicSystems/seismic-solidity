contract C {
    function test(uint256 n) external returns (uint256 r) {
        assembly {
            let i := 0
            for { } lt(i, n) { i := add(i, 1) } {
                let val := sload(7)
                cstore(7, add(val, 1))
            }
            r := i
        }
    }
}
// ----
// TypeError 10309: (192-200): Cannot use sload() on a slot that was previously written with cstore(). cstore() makes the slot private, and sload() cannot access private storage. Use cload() instead.
