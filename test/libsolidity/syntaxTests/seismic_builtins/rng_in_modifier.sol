// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng should be callable from a modifier.
contract C {
    modifier withRng() {
        suint256 r = sync_rng256();
        r;
        _;
    }

    function f() public withRng {
    }
}
// ----
