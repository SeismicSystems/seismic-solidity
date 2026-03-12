// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Assigning sync_rng_b1 to a larger sbytes type must fail.
contract C {
    function f() public view {
        sbytes32 a = sync_rng_b1();
        a;
    }
}
// ----
