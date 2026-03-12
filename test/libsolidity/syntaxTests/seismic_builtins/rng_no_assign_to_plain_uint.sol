// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng returns shielded types, which cannot be implicitly assigned to plain types.
contract C {
    function f() public view {
        uint256 a = sync_rng256();
        a;
    }
}
// ----
// TypeError 9574: (197-222): Type suint256 is not implicitly convertible to expected type uint256.
