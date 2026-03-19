// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_b functions take no arguments.
contract C {
    function f() public view {
        unsafe_rng_b32(42);
    }
}
// ----
// TypeError 6160: (152-168): Wrong argument count for function call: 1 arguments given but expected 0.
