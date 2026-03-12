// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng functions should not expose .value() member.
contract C {
    function f() public view {
        sync_rng256.value();
    }
}
// ----
// TypeError 8820: (166-183): Member "value" is only available for payable functions.
