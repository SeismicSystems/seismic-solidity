// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public view {
        sbytes9 r9 = sync_rng_b9();
        sbytes10 r10 = sync_rng_b10();
        sbytes11 r11 = sync_rng_b11();
        sbytes12 r12 = sync_rng_b12();
        sbytes13 r13 = sync_rng_b13();
        sbytes14 r14 = sync_rng_b14();
        sbytes15 r15 = sync_rng_b15();
        sbytes16 r16 = sync_rng_b16();
        r9; r10; r11; r12; r13; r14; r15; r16;
    }
}
// ----
