// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Assigning unsafe_rng_b32 to a smaller sbytes type must fail.
contract C {
    function f() public view {
        sbytes1 a = unsafe_rng_b32();
        a;
    }
}
// ----
// TypeError 9574: (173-201): Type sbytes32 is not implicitly convertible to expected type sbytes1.
