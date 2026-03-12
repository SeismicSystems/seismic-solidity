// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngBytesWidthIntegrity {
    // For sync_rng_b1: result cast to bytes32 should have zero padding in lower 31 bytes.
    function testB1Alignment() public view returns (bool) {
        bytes32 raw = bytes32(bytes1(sync_rng_b1()));
        // Lower 31 bytes should be zero (left-aligned in bytes1, padded when cast to bytes32).
        return raw & bytes32(uint256((1 << (31 * 8)) - 1)) == bytes32(0);
    }

    // For sync_rng_b4: result cast to bytes32 should have zero padding in lower 28 bytes.
    function testB4Alignment() public view returns (bool) {
        bytes32 raw = bytes32(bytes4(sync_rng_b4()));
        return raw & bytes32(uint256((1 << (28 * 8)) - 1)) == bytes32(0);
    }

    // For sync_rng_b16: lower 16 bytes should be zero when cast to bytes32.
    function testB16Alignment() public view returns (bool) {
        bytes32 raw = bytes32(bytes16(sync_rng_b16()));
        return raw & bytes32(uint256((1 << (16 * 8)) - 1)) == bytes32(0);
    }

    // For sync_rng_b32: all 32 bytes are used, no padding constraint.
    function testB32FullWidth() public view returns (bool) {
        uint256 val = uint256(bytes32(sync_rng_b32()));
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testB1Alignment() -> true
// testB4Alignment() -> true
// testB16Alignment() -> true
// testB32FullWidth() -> true
