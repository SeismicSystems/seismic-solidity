// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u functions take no arguments.
contract C {
    function f() public view {
        unsafe_rng_u256(42);
    }
}
// ----
// TypeError 6160: (154-173): Wrong argument count for function call: 1 arguments given but expected 0.
