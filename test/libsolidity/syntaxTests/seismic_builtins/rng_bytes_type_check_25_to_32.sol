// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public view {
        sbytes25 r25 = sync_rng_b25();
        sbytes26 r26 = sync_rng_b26();
        sbytes27 r27 = sync_rng_b27();
        sbytes28 r28 = sync_rng_b28();
        sbytes29 r29 = sync_rng_b29();
        sbytes30 r30 = sync_rng_b30();
        sbytes31 r31 = sync_rng_b31();
        sbytes32 r32 = sync_rng_b32();
        r25; r26; r27; r28; r29; r30; r31; r32;
    }
}
// ----
