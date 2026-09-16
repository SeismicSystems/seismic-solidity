// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngInLoop {
    // Generate 10 random values in a loop and verify they're not all the same.
    function testLoopDiversity() public view returns (bool) {
        uint256 first = uint256(unsafe_rng_u256());
        bool anyDifferent = false;
        for (uint i = 0; i < 9; i++) {
            uint256 val = uint256(unsafe_rng_u256());
            if (val != first) {
                anyDifferent = true;
            }
        }
        return anyDifferent;
    }

    // Accumulate XOR of 20 random bytes32 values. Result should be nonzero.
    function testLoopXorAccumulate() public view returns (bool) {
        bytes32 acc = bytes32(0);
        for (uint i = 0; i < 20; i++) {
            acc = acc ^ bytes32(unsafe_rng_b32());
        }
        return acc != bytes32(0);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testLoopDiversity() -> true
// testLoopXorAccumulate() -> true
