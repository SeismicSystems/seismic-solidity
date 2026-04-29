contract C {
    // The "seal a slot as private" pattern: read the current value via CLOAD
    // (which reads both domains), then write it back via CSTORE to claim the
    // slot for the shielded domain.
    //
    // EqualStoreEliminator wrongly treats the CSTORE as redundant because the
    // optimizer's confidentialStorage cache was populated by the preceding
    // CLOAD with the same value. The cache only encodes "value v lives in
    // slot k" — it doesn't encode the domain claim that CSTORE adds, so the
    // CSTORE must not be eliminated solely on a cache hit from a CLOAD.
    function seal(uint256 k) external {
        assembly {
            let v := cload(k)
            cstore(k, v)
        }
    }

    // Probes the slot via SLOAD. After seal() the slot should be claimed for
    // the shielded domain, so SLOAD must revert. If the optimizer dropped the
    // CSTORE, the slot is still unclaimed and SLOAD returns 0.
    function probe(uint256 k) external returns (uint256 r) {
        assembly {
            r := sload(k)
        }
    }
}
// ----
// seal(uint256): 0 ->
// probe(uint256): 0 -> FAILURE
