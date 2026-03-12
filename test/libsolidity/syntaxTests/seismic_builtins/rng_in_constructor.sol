// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng should be callable from a constructor.
contract C {
    suint256 private val;
    constructor() {
        val = sync_rng256();
    }
}
// ----
