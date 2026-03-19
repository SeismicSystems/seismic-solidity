// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_b result cannot be assigned to a shielded integer type.
contract C {
    function f() public view {
        suint256 a = unsafe_rng_b32();
        a;
    }
}
// ----
// TypeError 9574: (177-204): Type sbytes32 is not implicitly convertible to expected type suint256.
