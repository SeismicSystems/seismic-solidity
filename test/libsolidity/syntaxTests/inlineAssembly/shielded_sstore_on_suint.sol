contract C {
    suint x;
    function f() external {
        assembly {
            sstore(x.slot, 42)
        }
    }
}
// ----
// TypeError 5765: (85-103): Cannot use sstore() on shielded storage variable. Use cstore() instead.
