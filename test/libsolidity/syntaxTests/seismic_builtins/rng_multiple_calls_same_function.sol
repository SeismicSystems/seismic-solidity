// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Multiple unsafe_rng_u calls in the same function should compile.
contract C {
    function f() internal view returns (suint256, suint256, suint128, suint64) {
        return (unsafe_rng_u256(), unsafe_rng_u256(), unsafe_rng_u128(), unsafe_rng_u64());
    }
}
// ----
