// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng functions take no arguments.
contract C {
    function f() public view {
        sync_rng256(42);
    }
}
// ----
// TypeError 6160: (150-165): Wrong argument count for function call: 1 arguments given but expected 0.
