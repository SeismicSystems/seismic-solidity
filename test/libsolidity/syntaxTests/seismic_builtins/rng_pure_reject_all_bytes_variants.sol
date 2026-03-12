// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Every bytes sync_rng variant must be rejected in a pure context.
contract C {
    function a() internal pure returns (sbytes1) { return sync_rng_b1(); }
    function b() internal pure returns (sbytes8) { return sync_rng_b8(); }
    function c() internal pure returns (sbytes16) { return sync_rng_b16(); }
    function d() internal pure returns (sbytes24) { return sync_rng_b24(); }
    function e() internal pure returns (sbytes32) { return sync_rng_b32(); }
}
// ----
// TypeError 2527: (196-209): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (271-284): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (347-361): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (424-438): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (501-515): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
