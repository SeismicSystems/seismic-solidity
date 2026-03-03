// Variable-based slot matching: same Yul variable for cstore and sload slots
contract C {
    function test() external returns (uint c) {
        assembly {
            let s := 0
            cstore(s, 42)
            c := sload(s)
        }
    }
}
// ----
// TypeError 5768: (224-232): Cannot use sload() on a slot that was previously written with cstore(). cstore() makes the slot private, and sload() cannot access private storage. Use cload() instead.
