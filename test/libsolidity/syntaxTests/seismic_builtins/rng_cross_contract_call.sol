// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u can be used internally within contracts that interact.
contract RngProvider {
    function getRandom() internal view returns (suint256) {
        return unsafe_rng_u256();
    }
}

contract Consumer is RngProvider {
    suint256 private stored;

    function f() external {
        stored = getRandom();
    }
}
// ----
