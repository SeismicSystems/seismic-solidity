// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u integer cannot be assigned to an address or saddress.
contract C {
    function f() public view {
        address a = unsafe_rng_u256();
        saddress b = unsafe_rng_u256();
        a; b;
    }
}
// ----
// TypeError 9574: (175-200): Type suint256 is not implicitly convertible to expected type address.
// TypeError 9574: (210-236): Type suint256 is not implicitly convertible to expected type saddress.
