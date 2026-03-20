// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngModifierContext {
    suint256 private preVal;
    suint256 private postVal;

    modifier withRng() {
        preVal = unsafe_rng_u256();
        _;
        postVal = unsafe_rng_u256();
    }

    function execute() public withRng {
        // Body does nothing; modifier sets pre and post.
    }

    function testModifierValues() public view returns (bool) {
        // Both values should be nonzero.
        return uint256(preVal) != 0 && uint256(postVal) != 0;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// execute() ->
// testModifierValues() -> true
