// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u integer result cannot be assigned to a shielded bytes type.
contract C {
    function f() public view {
        sbytes32 a = unsafe_rng_u256();
        a;
    }
}
// ----
// TypeError 9574: (185-215): Type suint256 is not implicitly convertible to expected type sbytes32.
