// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng functions should not expose .gas() member.
contract C {
    function f() public view {
        sync_rng256.gas();
    }
}
// ----
// TypeError 9582: (164-179): Member "gas" not found or not visible after argument-dependent lookup in function () view returns (suint256).
