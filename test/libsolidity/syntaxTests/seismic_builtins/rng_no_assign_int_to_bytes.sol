// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng integer result cannot be assigned to a shielded bytes type.
contract C {
    function f() public view {
        sbytes32 a = sync_rng256();
        a;
    }
}
// ----
// TypeError 9574: (181-207): Type suint256 is not implicitly convertible to expected type sbytes32.
