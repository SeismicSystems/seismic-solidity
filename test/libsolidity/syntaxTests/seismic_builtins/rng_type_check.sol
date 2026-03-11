// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public view {
        suint8 r8 = sync_rng8();
        suint16 r16 = sync_rng16();
        suint32 r32 = sync_rng32();
        suint64 r64 = sync_rng64();
        suint96 r96 = sync_rng96();
        suint128 r128 = sync_rng128();
        suint256 r256 = sync_rng256();
        r8; r16; r32; r64; r96; r128; r256;
    }
}
// ----
