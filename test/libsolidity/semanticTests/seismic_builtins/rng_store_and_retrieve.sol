// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngStoreAndRetrieve {
    suint256 private storedVal;
    sbytes32 private storedBytes;

    // Store sync_rng result in confidential storage and verify it persists.
    function storeRng256() public {
        storedVal = sync_rng256();
    }

    function retrieveStored256() public view returns (bool) {
        // The stored value should be nonzero (with overwhelming probability).
        return uint256(storedVal) != 0;
    }

    function storeRngB32() public {
        storedBytes = sync_rng_b32();
    }

    function retrieveStoredB32() public view returns (bool) {
        return bytes32(storedBytes) != bytes32(0);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// storeRng256() ->
// retrieveStored256() -> true
// storeRngB32() ->
// retrieveStoredB32() -> true
