// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u should be callable from a constructor.
contract C {
    suint256 private val;
    constructor() {
        val = unsafe_rng_u256();
    }
}
// ----
