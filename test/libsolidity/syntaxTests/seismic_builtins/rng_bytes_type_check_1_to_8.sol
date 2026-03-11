// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public view {
        sbytes1 r1 = sync_rng_b1();
        sbytes2 r2 = sync_rng_b2();
        sbytes3 r3 = sync_rng_b3();
        sbytes4 r4 = sync_rng_b4();
        sbytes5 r5 = sync_rng_b5();
        sbytes6 r6 = sync_rng_b6();
        sbytes7 r7 = sync_rng_b7();
        sbytes8 r8 = sync_rng_b8();
        r1; r2; r3; r4; r5; r6; r7; r8;
    }
}
// ----
