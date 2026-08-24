// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngProvider {
    function getRandom256() external view returns (uint256) {
        return uint256(unsafe_rng_u256());
    }

    function getRandomB32() external view returns (bytes32) {
        return bytes32(unsafe_rng_b32());
    }
}

contract RngCrossContract {
    RngProvider provider;

    constructor() {
        provider = new RngProvider();
    }

    // Random values from an external call should look random.
    function testCrossContract256() public view returns (bool) {
        uint256 val = provider.getRandom256();
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }

    function testCrossContractB32() public view returns (bool) {
        uint256 val = uint256(provider.getRandomB32());
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testCrossContract256() -> true
// testCrossContractB32() -> true
