// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng functions should be callable from internal view functions.
contract C {
    function f() internal view returns (suint256) {
        return sync_rng256();
    }
}
// ----
