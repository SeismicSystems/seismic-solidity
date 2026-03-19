// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u result can be assigned to a struct field with shielded type.
contract C {
    struct SecretData {
        suint256 value;
        sbytes32 token;
    }

    SecretData private data;

    function f() public {
        data.value = unsafe_rng_u256();
        data.token = unsafe_rng_b32();
    }
}
// ----
