// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u returns shielded types, which cannot be implicitly assigned to plain types.
contract C {
    function f() public view {
        uint256 a = unsafe_rng_u256();
        a;
    }
}
// ----
// TypeError 9574: (201-230): Type suint256 is not implicitly convertible to expected type uint256.
