// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public view {
        suint8 r8 = unsafe_rng_u8();
        suint16 r16 = unsafe_rng_u16();
        suint32 r32 = unsafe_rng_u32();
        suint64 r64 = unsafe_rng_u64();
        suint96 r96 = unsafe_rng_u96();
        suint128 r128 = unsafe_rng_u128();
        suint256 r256 = unsafe_rng_u256();
        r8; r16; r32; r64; r96; r128; r256;
    }
}
// ----
