// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng_b functions should not expose .gas() member.
contract C {
    function f() public view {
        sync_rng_b32.gas();
    }
}
// ----
// TypeError 9582: (166-182): Member "gas" not found or not visible after argument-dependent lookup in function () view returns (sbytes32).
