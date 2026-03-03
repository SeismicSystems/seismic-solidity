// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() internal pure returns (suint256) {
        return rng256();
    }
}
// ----
// TypeError 2527: (137-145): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
