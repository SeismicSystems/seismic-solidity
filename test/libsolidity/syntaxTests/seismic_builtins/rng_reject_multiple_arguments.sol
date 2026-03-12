// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng functions reject multiple arguments.
contract C {
    function f() public view {
        sync_rng256(1, 2, 3);
    }
}
// ----
// TypeError 6160: (158-178): Wrong argument count for function call: 3 arguments given but expected 0.
