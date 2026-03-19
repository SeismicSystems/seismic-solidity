// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Assigning unsafe_rng_b1 to a larger sbytes type must fail.
contract C {
    function f() public view {
        sbytes32 a = unsafe_rng_b1();
        a;
    }
}
// ----
