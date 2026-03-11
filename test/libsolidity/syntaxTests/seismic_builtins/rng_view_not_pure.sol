// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() internal pure returns (suint256) {
        return sync_rng256();
    }
}
// ----
// TypeError 2527: (137-150): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
