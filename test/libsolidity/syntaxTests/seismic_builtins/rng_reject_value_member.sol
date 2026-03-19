// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u functions should not expose .value() member.
contract C {
    function f() public view {
        unsafe_rng_u256.value();
    }
}
// ----
// TypeError 8820: (166-183): Member "value" is only available for payable functions.
