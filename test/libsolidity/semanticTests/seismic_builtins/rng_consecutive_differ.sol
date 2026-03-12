// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngConsecutiveDiffer {
    // Verify that consecutive sync_rng256 calls can produce different values.
    // We call multiple times and check they are not all identical.
    // P(false positive) = (1/2^256)^3 ≈ 0, effectively impossible.
    function testConsecutiveCallsDiffer() public view returns (bool) {
        uint256 a = uint256(sync_rng256());
        uint256 b = uint256(sync_rng256());
        uint256 c = uint256(sync_rng256());
        uint256 d = uint256(sync_rng256());
        // At least one pair must differ
        return (a != b) || (b != c) || (c != d);
    }

    // Same test for a smaller type.
    function testConsecutive64Differ() public view returns (bool) {
        uint64 a = uint64(sync_rng64());
        uint64 b = uint64(sync_rng64());
        uint64 c = uint64(sync_rng64());
        uint64 d = uint64(sync_rng64());
        return (a != b) || (b != c) || (c != d);
    }

    // Same test for bytes variant.
    function testConsecutiveB32Differ() public view returns (bool) {
        bytes32 a = bytes32(sync_rng_b32());
        bytes32 b = bytes32(sync_rng_b32());
        bytes32 c = bytes32(sync_rng_b32());
        bytes32 d = bytes32(sync_rng_b32());
        return (a != b) || (b != c) || (c != d);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testConsecutiveCallsDiffer() -> true
// testConsecutive64Differ() -> true
// testConsecutiveB32Differ() -> true
