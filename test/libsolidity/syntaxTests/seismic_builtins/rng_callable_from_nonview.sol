// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u functions should be callable from non-pure/non-view (state-mutating) functions.
contract C {
    suint256 private stored;

    function f() public {
        stored = unsafe_rng_u256();
    }
}
// ----
