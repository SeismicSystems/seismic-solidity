// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngInConstructor {
    suint256 private val;

    constructor() {
        val = unsafe_rng_u256();
    }

    // Value set in constructor should be nonzero.
    function testConstructorRng() public view returns (bool) {
        return uint256(val) != 0;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testConstructorRng() -> true
