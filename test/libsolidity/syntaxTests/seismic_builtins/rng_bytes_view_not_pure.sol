// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() internal pure returns (sbytes32) {
        return unsafe_rng_b32();
    }
}
// ----
// TypeError 2527: (137-153): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
