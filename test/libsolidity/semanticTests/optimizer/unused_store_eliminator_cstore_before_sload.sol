contract C {
    // The first CSTORE should claim slot 0 for the shielded domain. The
    // following SLOAD on slot 0 must therefore revert (cross-domain access).
    //
    // If UnusedStoreEliminator wrongly treats the SLOAD as unrelated to the
    // CSTORE because they live in different domains, it eliminates the first
    // CSTORE, leaving the slot unclaimed when SLOAD runs. SLOAD then returns
    // zero instead of reverting and trigger() succeeds — that is the bug.
    function trigger(uint256 x, uint256 y) external returns (uint256 v) {
        assembly {
            cstore(add(0, 0), x)
            v := sload(add(0, 0))
            cstore(add(0, 0), y)
        }
    }
}
// ----
// trigger(uint256,uint256): 100, 200 -> FAILURE
