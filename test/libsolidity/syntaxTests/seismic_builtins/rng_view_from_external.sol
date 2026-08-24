// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u functions should be callable from external functions (storing result).
contract C {
    suint256 private stored;

    function f() external {
        stored = unsafe_rng_u256();
    }
}
// ----
