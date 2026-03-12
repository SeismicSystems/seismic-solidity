// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng result can be used in expressions and comparisons.
contract C {
    suint256 private stored;

    function f() public {
        suint256 r = sync_rng256();
        stored = r;
    }
}
// ----
