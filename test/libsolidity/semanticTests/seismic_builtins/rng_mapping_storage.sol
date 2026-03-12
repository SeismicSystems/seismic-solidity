// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngMappingStorage {
    mapping(uint256 => suint256) private m;

    // Store random values in a mapping and verify they persist.
    function storeRandomValues() public {
        for (uint256 i = 0; i < 5; i++) {
            m[i] = sync_rng256();
        }
    }

    // All stored values should be nonzero.
    function testAllNonzero() public view returns (bool) {
        for (uint256 i = 0; i < 5; i++) {
            if (uint256(m[i]) == 0) return false;
        }
        return true;
    }

    // At least two stored values should differ.
    function testNotAllSame() public view returns (bool) {
        uint256 first = uint256(m[0]);
        for (uint256 i = 1; i < 5; i++) {
            if (uint256(m[i]) != first) return true;
        }
        return false;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// storeRandomValues() ->
// testAllNonzero() -> true
// testNotAllSame() -> true
