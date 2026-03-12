// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng can be used internally within contracts that interact.
contract RngProvider {
    function getRandom() internal view returns (suint256) {
        return sync_rng256();
    }
}

contract Consumer is RngProvider {
    suint256 private stored;

    function f() external {
        stored = getRandom();
    }
}
// ----
