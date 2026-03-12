// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngStructStorage {
    struct SecretData {
        suint256 value;
        sbytes32 token;
        suint64 small;
    }

    SecretData private data;

    function storeRng() public {
        data.value = sync_rng256();
        data.token = sync_rng_b32();
        data.small = sync_rng64();
    }

    function testAllFieldsNonzero() public view returns (bool) {
        return uint256(data.value) != 0
            && bytes32(data.token) != bytes32(0)
            && uint64(data.small) != 0;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// storeRng() ->
// testAllFieldsNonzero() -> true
