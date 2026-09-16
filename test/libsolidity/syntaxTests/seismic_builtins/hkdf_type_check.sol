// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() internal view {
        bytes memory input = new bytes(32);
        bytes32 result = hkdf(input);
        result;
    }
}
// ----
