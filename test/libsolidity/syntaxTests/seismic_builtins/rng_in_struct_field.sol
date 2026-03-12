// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng result can be assigned to a struct field with shielded type.
contract C {
    struct SecretData {
        suint256 value;
        sbytes32 token;
    }

    SecretData private data;

    function f() public {
        data.value = sync_rng256();
        data.token = sync_rng_b32();
    }
}
// ----
