// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng should work across inheritance.
contract Base {
    function getRng() internal view returns (suint256) {
        return sync_rng256();
    }
}

contract Derived is Base {
    suint256 private val;

    function f() public {
        val = getRng();
    }
}
// ----
