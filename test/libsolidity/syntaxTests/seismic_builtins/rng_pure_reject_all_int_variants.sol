// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Every integer unsafe_rng_u variant must be rejected in a pure context.
contract C {
    function a() internal pure returns (suint8) { return unsafe_rng_u8(); }
    function b() internal pure returns (suint16) { return unsafe_rng_u16(); }
    function c() internal pure returns (suint32) { return unsafe_rng_u32(); }
    function d() internal pure returns (suint64) { return unsafe_rng_u64(); }
    function e() internal pure returns (suint96) { return unsafe_rng_u96(); }
    function f() internal pure returns (suint128) { return unsafe_rng_u128(); }
    function g() internal pure returns (suint256) { return unsafe_rng_u256(); }
}
// ----
// TypeError 2527: (201-216): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (278-294): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (356-372): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (434-450): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (512-528): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (591-608): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (671-688): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
