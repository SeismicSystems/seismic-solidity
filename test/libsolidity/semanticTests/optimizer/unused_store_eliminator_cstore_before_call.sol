contract C {
    suint256 private secret;          // slot 0 (shielded domain)
    uint256 public probedValue;       // slot 1 (public domain)

    // Re-entered via the self-call inside trigger() between the two CSTOREs.
    // We CLOAD slot 0 to capture whatever the shielded domain currently holds
    // and stash it in a public slot we can read afterwards.
    //
    // Behaviour depending on whether trigger()'s first CSTORE was preserved:
    //   - preserved:    cload(0) returns 100  -> probedValue() returns 100
    //   - eliminated:   slot 0 is uninitialized, cload(0) returns 0
    //                   -> probedValue() returns 0
    fallback() external {
        assembly {
            sstore(1, cload(0))
        }
    }

    function trigger() external {
        address self = address(this);
        assembly {
            cstore(secret.slot, 100)
            pop(call(gas(), self, 0, 0, 0, 0, 0))
            cstore(secret.slot, 200)
        }
    }
}
// ----
// trigger() ->
// probedValue() -> 100
