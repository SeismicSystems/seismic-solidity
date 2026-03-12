// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng functions should be callable from non-pure/non-view (state-mutating) functions.
contract C {
    suint256 private stored;

    function f() public {
        stored = sync_rng256();
    }
}
// ----
