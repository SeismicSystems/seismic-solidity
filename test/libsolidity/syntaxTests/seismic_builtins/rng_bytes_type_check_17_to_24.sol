// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public view {
        sbytes17 r17 = sync_rng_b17();
        sbytes18 r18 = sync_rng_b18();
        sbytes19 r19 = sync_rng_b19();
        sbytes20 r20 = sync_rng_b20();
        sbytes21 r21 = sync_rng_b21();
        sbytes22 r22 = sync_rng_b22();
        sbytes23 r23 = sync_rng_b23();
        sbytes24 r24 = sync_rng_b24();
        r17; r18; r19; r20; r21; r22; r23; r24;
    }
}
// ----
