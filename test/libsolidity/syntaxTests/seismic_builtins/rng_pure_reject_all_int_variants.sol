// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Every integer sync_rng variant must be rejected in a pure context.
contract C {
    function a() internal pure returns (suint8) { return sync_rng8(); }
    function b() internal pure returns (suint16) { return sync_rng16(); }
    function c() internal pure returns (suint32) { return sync_rng32(); }
    function d() internal pure returns (suint64) { return sync_rng64(); }
    function e() internal pure returns (suint96) { return sync_rng96(); }
    function f() internal pure returns (suint128) { return sync_rng128(); }
    function g() internal pure returns (suint256) { return sync_rng256(); }
}
// ----
// TypeError 2527: (197-208): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (270-282): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (344-356): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (418-430): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (492-504): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (567-580): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (643-656): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
