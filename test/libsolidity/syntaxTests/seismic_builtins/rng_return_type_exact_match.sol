// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Each sync_rng variant returns exactly the right shielded type.
contract C {
    function a() internal view returns (suint8) { return sync_rng8(); }
    function b() internal view returns (suint16) { return sync_rng16(); }
    function c() internal view returns (suint32) { return sync_rng32(); }
    function d() internal view returns (suint64) { return sync_rng64(); }
    function e() internal view returns (suint96) { return sync_rng96(); }
    function f() internal view returns (suint128) { return sync_rng128(); }
    function g() internal view returns (suint256) { return sync_rng256(); }
    function h() internal view returns (sbytes1) { return sync_rng_b1(); }
    function i() internal view returns (sbytes16) { return sync_rng_b16(); }
    function j() internal view returns (sbytes32) { return sync_rng_b32(); }
}
// ----
