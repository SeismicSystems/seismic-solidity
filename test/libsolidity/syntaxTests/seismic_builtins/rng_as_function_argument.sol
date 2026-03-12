// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng result can be passed as an argument to another function.
contract C {
    function consume(suint256 val) internal pure {
        val;
    }

    function f() public view {
        consume(sync_rng256());
    }
}
// ----
