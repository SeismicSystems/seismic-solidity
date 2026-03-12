// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng integer cannot be assigned to an address or saddress.
contract C {
    function f() public view {
        address a = sync_rng256();
        saddress b = sync_rng256();
        a; b;
    }
}
// ----
// TypeError 9574: (175-200): Type suint256 is not implicitly convertible to expected type address.
// TypeError 9574: (210-236): Type suint256 is not implicitly convertible to expected type saddress.
