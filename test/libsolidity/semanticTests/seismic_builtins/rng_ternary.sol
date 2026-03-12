// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngTernary {
    // sync_rng should work in both branches of a ternary.
    function testTernaryTrue() public view returns (bool) {
        uint256 val = uint256(true ? sync_rng256() : sync_rng256());
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }

    function testTernaryFalse() public view returns (bool) {
        uint256 val = uint256(false ? sync_rng256() : sync_rng256());
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testTernaryTrue() -> true
// testTernaryFalse() -> true
