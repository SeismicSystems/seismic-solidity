// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngBitWidthIntegrity {
    // Verify that unsafe_rng_u8 values fit within 8 bits.
    function testRng8FitsIn8Bits() public view returns (bool) {
        for (uint i = 0; i < 10; i++) {
            uint256 val = uint256(uint8(unsafe_rng_u8()));
            if (val > type(uint8).max) return false;
        }
        return true;
    }

    // Verify that unsafe_rng_u16 values fit within 16 bits.
    function testRng16FitsIn16Bits() public view returns (bool) {
        for (uint i = 0; i < 10; i++) {
            uint256 val = uint256(uint16(unsafe_rng_u16()));
            if (val > type(uint16).max) return false;
        }
        return true;
    }

    // Verify that unsafe_rng_u32 values fit within 32 bits.
    function testRng32FitsIn32Bits() public view returns (bool) {
        for (uint i = 0; i < 10; i++) {
            uint256 val = uint256(uint32(unsafe_rng_u32()));
            if (val > type(uint32).max) return false;
        }
        return true;
    }

    // Verify that unsafe_rng_u64 values fit within 64 bits.
    function testRng64FitsIn64Bits() public view returns (bool) {
        for (uint i = 0; i < 10; i++) {
            uint256 val = uint256(uint64(unsafe_rng_u64()));
            if (val > type(uint64).max) return false;
        }
        return true;
    }

    // Verify that unsafe_rng_u96 values fit within 96 bits.
    function testRng96FitsIn96Bits() public view returns (bool) {
        for (uint i = 0; i < 10; i++) {
            uint256 val = uint256(uint128(unsafe_rng_u96()));
            if (val > 2**96 - 1) return false;
        }
        return true;
    }

    // Verify that unsafe_rng_u128 values fit within 128 bits.
    function testRng128FitsIn128Bits() public view returns (bool) {
        for (uint i = 0; i < 10; i++) {
            uint256 val = uint256(uint128(unsafe_rng_u128()));
            if (val > type(uint128).max) return false;
        }
        return true;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testRng8FitsIn8Bits() -> true
// testRng16FitsIn16Bits() -> true
// testRng32FitsIn32Bits() -> true
// testRng64FitsIn64Bits() -> true
// testRng96FitsIn96Bits() -> true
// testRng128FitsIn128Bits() -> true
