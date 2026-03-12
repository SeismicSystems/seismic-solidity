// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng results cannot be returned from public functions.
contract C {
    function a() public view returns (suint256) {
        return sync_rng256();
    }
    function b() public view returns (sbytes32) {
        return sync_rng_b32();
    }
}
// ----
// TypeError 7492: (170-178): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 7492: (256-264): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
