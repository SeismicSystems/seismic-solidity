// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Assigning a smaller sync_rng result to a larger shielded type must fail.
contract C {
    function f() public view {
        suint256 a = sync_rng8();
        a;
    }
}
// ----
