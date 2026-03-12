// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngWithOtherBuiltins {
    // sync_rng should work alongside other built-in operations.
    function testWithKeccak() public view returns (bool) {
        bytes32 rngVal = bytes32(sync_rng_b32());
        bytes32 hashed = keccak256(abi.encodePacked(rngVal));
        // Hash of a random value should be nonzero.
        return hashed != bytes32(0);
    }

    function testWithGasleft() public view returns (bool) {
        uint256 gasBefore = gasleft();
        uint256 rngVal = uint256(sync_rng256());
        uint256 gasAfter = gasleft();
        // The RNG call should consume some gas.
        return gasBefore > gasAfter && rngVal != 0;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testWithKeccak() -> true
// testWithGasleft() -> true
