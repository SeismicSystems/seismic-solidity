// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngMultipleTypesSingleTx {
    // Call every integer width in one transaction and verify all look random.
    function testAllIntegerWidths() public view returns (bool) {
        uint256 r8   = uint256(uint8(unsafe_rng_u8()));
        uint256 r16  = uint256(uint16(unsafe_rng_u16()));
        uint256 r32  = uint256(uint32(unsafe_rng_u32()));
        uint256 r64  = uint256(uint64(unsafe_rng_u64()));
        uint256 r96  = uint256(uint128(unsafe_rng_u96()));
        uint256 r128 = uint256(uint128(unsafe_rng_u128()));
        uint256 r256 = uint256(unsafe_rng_u256());

        // Each value should be nonzero with overwhelming probability.
        // P(any one is zero) = 1/2^N, and we OR them all.
        // We do a weaker check: the XOR of all should be nonzero.
        uint256 combined = r8 ^ r16 ^ r32 ^ r64 ^ r96 ^ r128 ^ r256;
        return combined != 0;
    }

    // Call several byte widths in one transaction.
    function testMixedByteWidths() public view returns (bool) {
        bytes32 b1  = bytes32(bytes1(unsafe_rng_b1())) >> 0;
        bytes32 b8  = bytes32(bytes8(unsafe_rng_b8())) >> 0;
        bytes32 b16 = bytes32(bytes16(unsafe_rng_b16())) >> 0;
        bytes32 b32 = bytes32(unsafe_rng_b32());

        return (b1 | b8 | b16 | b32) != bytes32(0);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testAllIntegerWidths() -> true
// testMixedByteWidths() -> true
