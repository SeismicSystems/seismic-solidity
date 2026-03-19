// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Assigning unsafe_rng_u result to the wrong shielded integer width must fail.
contract C {
    function f() public view {
        suint8 a = unsafe_rng_u256();
        a;
    }
}
// ----
// TypeError 9574: (185-209): Type suint256 is not implicitly convertible to expected type suint8.
