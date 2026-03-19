// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngExplicitCast {
    // Explicit cast from shielded to plain should work and preserve value.
    function testCastSuint256ToUint256() public view returns (bool) {
        suint256 r = unsafe_rng_u256();
        uint256 plain = uint256(r);
        // The value should be nonzero with overwhelming probability.
        return plain != 0;
    }

    function testCastSuint8ToUint8() public view returns (bool) {
        // Multiple samples to avoid false positive.
        uint8 a = uint8(unsafe_rng_u8());
        uint8 b = uint8(unsafe_rng_u8());
        uint8 c = uint8(unsafe_rng_u8());
        uint8 d = uint8(unsafe_rng_u8());
        return (a | b | c | d) != 0;
    }

    function testCastSbytes32ToBytes32() public view returns (bool) {
        sbytes32 r = unsafe_rng_b32();
        bytes32 plain = bytes32(r);
        return plain != bytes32(0);
    }

    function testCastSbytes1ToBytes1() public view returns (bool) {
        bytes1 a = bytes1(unsafe_rng_b1());
        bytes1 b = bytes1(unsafe_rng_b1());
        bytes1 c = bytes1(unsafe_rng_b1());
        bytes1 d = bytes1(unsafe_rng_b1());
        return (a | b | c | d) != bytes1(0);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testCastSuint256ToUint256() -> true
// testCastSuint8ToUint8() -> true
// testCastSbytes32ToBytes32() -> true
// testCastSbytes1ToBytes1() -> true
