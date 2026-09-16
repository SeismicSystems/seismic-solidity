// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u should work across inheritance.
contract Base {
    function getRng() internal view returns (suint256) {
        return unsafe_rng_u256();
    }
}

contract Derived is Base {
    suint256 private val;

    function f() public {
        val = getRng();
    }
}
// ----
