// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng result cannot be assigned to bool or sbool.
contract C {
    function f() public view {
        bool a = sync_rng8();
        sbool b = sync_rng8();
        a; b;
    }
}
// ----
// TypeError 9574: (165-185): Type suint8 is not implicitly convertible to expected type bool.
// TypeError 9574: (195-216): Type suint8 is not implicitly convertible to expected type sbool.
