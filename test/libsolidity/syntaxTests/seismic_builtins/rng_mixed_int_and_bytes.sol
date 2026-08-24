// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Mixing unsafe_rng_u integer and bytes calls in the same function should compile.
contract C {
    function f() public view {
        suint256 a = unsafe_rng_u256();
        sbytes32 b = unsafe_rng_b32();
        suint8 c = unsafe_rng_u8();
        sbytes1 d = unsafe_rng_b1();
        a; b; c; d;
    }
}
// ----
