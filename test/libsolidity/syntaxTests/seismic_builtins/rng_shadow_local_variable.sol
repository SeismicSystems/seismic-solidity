// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A local variable named sync_rng256 should shadow the built-in.
contract C {
    function f() public pure returns (uint256) {
        uint256 sync_rng256 = 42;
        return sync_rng256;
    }
}
// ----
// Warning 2319: (193-212): This declaration shadows a builtin symbol.
