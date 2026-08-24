// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_b functions should not expose .gas() member.
contract C {
    function f() public view {
        unsafe_rng_b32.gas();
    }
}
// ----
// TypeError 9582: (168-186): Member "gas" not found or not visible after argument-dependent lookup in function () view returns (sbytes32).
