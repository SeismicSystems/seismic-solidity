// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u should be callable from a modifier.
contract C {
    modifier withRng() {
        suint256 r = unsafe_rng_u256();
        r;
        _;
    }

    function f() public withRng {
    }
}
// ----
