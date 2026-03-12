// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Multiple sync_rng calls in the same function should compile.
contract C {
    function f() internal view returns (suint256, suint256, suint128, suint64) {
        return (sync_rng256(), sync_rng256(), sync_rng128(), sync_rng64());
    }
}
// ----
