// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u results cannot be returned from public functions.
contract C {
    function a() public view returns (suint256) {
        return unsafe_rng_u256();
    }
    function b() public view returns (sbytes32) {
        return unsafe_rng_b32();
    }
}
// ----
// TypeError 10102: (170-178): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 10102: (256-264): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
