// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u functions should be callable from private view functions.
contract C {
    function f() private view returns (suint256) {
        return unsafe_rng_u256();
    }
}
// ----
