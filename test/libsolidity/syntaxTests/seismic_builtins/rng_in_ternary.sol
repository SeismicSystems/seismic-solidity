// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u calls in ternary expressions should compile.
contract C {
    function f(bool cond) internal view returns (suint256) {
        return cond ? unsafe_rng_u256() : unsafe_rng_u256();
    }
}
// ----
