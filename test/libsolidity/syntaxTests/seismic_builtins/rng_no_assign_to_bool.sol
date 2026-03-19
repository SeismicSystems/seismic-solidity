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
// TypeError 9574: (165-185): Type suint8 is not implicitly convertible to expected type bool.
// TypeError 9574: (195-216): Type suint8 is not implicitly convertible to expected type sbool.
