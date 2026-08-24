// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u functions should not expose .gas() member.
contract C {
    function f() public view {
        unsafe_rng_u256.gas();
    }
}
// ----
// TypeError 9582: (168-187): Member "gas" not found or not visible after argument-dependent lookup in function () view returns (suint256).
