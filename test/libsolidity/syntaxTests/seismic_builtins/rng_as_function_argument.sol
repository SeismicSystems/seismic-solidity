// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u result can be passed as an argument to another function.
contract C {
    function consume(suint256 val) internal pure {
        val;
    }

    function f() public view {
        consume(unsafe_rng_u256());
    }
}
// ----
