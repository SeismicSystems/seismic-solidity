// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Each unsafe_rng_u variant returns exactly the right shielded type.
contract C {
    function a() internal view returns (suint8) { return unsafe_rng_u8(); }
    function b() internal view returns (suint16) { return unsafe_rng_u16(); }
    function c() internal view returns (suint32) { return unsafe_rng_u32(); }
    function d() internal view returns (suint64) { return unsafe_rng_u64(); }
    function e() internal view returns (suint96) { return unsafe_rng_u96(); }
    function f() internal view returns (suint128) { return unsafe_rng_u128(); }
    function g() internal view returns (suint256) { return unsafe_rng_u256(); }
    function h() internal view returns (sbytes1) { return unsafe_rng_b1(); }
    function i() internal view returns (sbytes16) { return unsafe_rng_b16(); }
    function j() internal view returns (sbytes32) { return unsafe_rng_b32(); }
}
// ----
