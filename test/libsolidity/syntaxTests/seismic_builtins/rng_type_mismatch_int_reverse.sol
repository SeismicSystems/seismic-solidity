// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Assigning a smaller unsafe_rng_u result to a larger shielded type must fail.
contract C {
    function f() public view {
        suint256 a = unsafe_rng_u8();
        a;
    }
}
// ----
