// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Every bytes unsafe_rng_u variant must be rejected in a pure context.
contract C {
    function a() internal pure returns (sbytes1) { return unsafe_rng_b1(); }
    function b() internal pure returns (sbytes8) { return unsafe_rng_b8(); }
    function c() internal pure returns (sbytes16) { return unsafe_rng_b16(); }
    function d() internal pure returns (sbytes24) { return unsafe_rng_b24(); }
    function e() internal pure returns (sbytes32) { return unsafe_rng_b32(); }
}
// ----
// TypeError 2527: (200-215): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (277-292): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (355-371): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (434-450): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
// TypeError 2527: (513-529): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
