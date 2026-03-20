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
// TypeError 9574: (179-208): Type suint256 is not implicitly convertible to expected type address.
// TypeError 9574: (218-248): Type suint256 is not implicitly convertible to expected type saddress.
