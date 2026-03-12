// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Assigning sync_rng result to the wrong shielded integer width must fail.
contract C {
    function f() public view {
        suint8 a = sync_rng256();
        a;
    }
}
// ----
// TypeError 9574: (185-209): Type suint256 is not implicitly convertible to expected type suint8.
