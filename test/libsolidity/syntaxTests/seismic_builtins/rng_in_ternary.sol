// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng calls in ternary expressions should compile.
contract C {
    function f(bool cond) internal view returns (suint256) {
        return cond ? sync_rng256() : sync_rng256();
    }
}
// ----
