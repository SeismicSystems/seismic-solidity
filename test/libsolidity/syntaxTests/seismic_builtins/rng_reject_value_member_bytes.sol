// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_b functions should not expose .value() member.
contract C {
    function f() public view {
        unsafe_rng_b32.value();
    }
}
// ----
// TypeError 8820: (170-190): Member "value" is only available for payable functions.
