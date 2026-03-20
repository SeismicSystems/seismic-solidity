// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u result can be used in expressions and comparisons.
contract C {
    suint256 private stored;

    function f() public {
        suint256 r = unsafe_rng_u256();
        stored = r;
    }
}
// ----
