// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A local variable named unsafe_rng_u256 should shadow the built-in.
contract C {
    function f() public pure returns (uint256) {
        uint256 unsafe_rng_u256 = 42;
        return unsafe_rng_u256;
    }
}
// ----
// Warning 2319: (197-220): This declaration shadows a builtin symbol.
