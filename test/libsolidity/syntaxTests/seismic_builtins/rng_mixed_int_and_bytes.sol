// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Mixing sync_rng integer and bytes calls in the same function should compile.
contract C {
    function f() public view {
        suint256 a = sync_rng256();
        sbytes32 b = sync_rng_b32();
        suint8 c = sync_rng8();
        sbytes1 d = sync_rng_b1();
        a; b; c; d;
    }
}
// ----
