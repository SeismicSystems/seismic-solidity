// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u result cannot be assigned to bool or sbool.
contract C {
    function f() public view {
        bool a = unsafe_rng_u8();
        sbool b = unsafe_rng_u8();
        a; b;
    }
}
// ----
// TypeError 9574: (169-193): Type suint8 is not implicitly convertible to expected type bool.
// TypeError 9574: (203-228): Type suint8 is not implicitly convertible to expected type sbool.
