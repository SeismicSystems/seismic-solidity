// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngBuiltins {
    // Each test verifies the unsafe_rng_u call succeeds and the result looks random.
    // For N-bit types (N >= 30): check val in [2^(N-30), max - 2^(N-30)].
    // P(false positive) ≈ 2 * 2^(-30) ≈ 2e-9 per test.
    // For smaller types: combine multiple samples.

    function testRng256() public view returns (bool) {
        uint256 val = uint256(unsafe_rng_u256());
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }

    function testRng128() public view returns (bool) {
        uint128 val = uint128(unsafe_rng_u128());
        return val >= 2**98 && val <= type(uint128).max - 2**98;
    }

    function testRng96() public view returns (bool) {
        uint128 val = uint128(unsafe_rng_u96());
        return val >= 2**66 && val <= 2**96 - 1 - 2**66;
    }

    function testRng64() public view returns (bool) {
        uint64 val = uint64(unsafe_rng_u64());
        return val >= 2**34 && val <= type(uint64).max - 2**34;
    }

    function testRng32() public view returns (bool) {
        uint32 val = uint32(unsafe_rng_u32());
        return val >= 4 && val <= type(uint32).max - 4;
    }

    function testRng16() public view returns (bool) {
        // 16 bits: two samples, check not all-zero and not all-ones.
        // P(false positive) ≈ 2 * (1/2^16)^2 ≈ 5e-10.
        uint16 a = uint16(unsafe_rng_u16());
        uint16 b = uint16(unsafe_rng_u16());
        return (a | b) > 0 && (a & b) < type(uint16).max;
    }

    function testRng8() public view returns (bool) {
        // 8 bits: four samples, check not all-zero and not all-ones.
        // P(false positive) ≈ 2 * (1/2^8)^4 ≈ 5e-10.
        uint8 a = uint8(unsafe_rng_u8());
        uint8 b = uint8(unsafe_rng_u8());
        uint8 c = uint8(unsafe_rng_u8());
        uint8 d = uint8(unsafe_rng_u8());
        return (a | b | c | d) > 0 && (a & b & c & d) < type(uint8).max;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testRng256() -> true
// testRng128() -> true
// testRng96() -> true
// testRng64() -> true
// testRng32() -> true
// testRng16() -> true
// testRng8() -> true
