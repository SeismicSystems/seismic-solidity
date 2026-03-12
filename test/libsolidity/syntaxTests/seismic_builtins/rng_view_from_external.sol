// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng functions should be callable from external functions (storing result).
contract C {
    suint256 private stored;

    function f() external {
        stored = sync_rng256();
    }
}
// ----
