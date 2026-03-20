// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u result can be stored in a mapping with shielded value type.
contract C {
    mapping(uint256 => suint256) private m;

    function f(uint256 key) public {
        m[key] = unsafe_rng_u256();
    }
}
// ----
