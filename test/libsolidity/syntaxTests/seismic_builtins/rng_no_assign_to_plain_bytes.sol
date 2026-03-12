// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng_b returns shielded bytes, which cannot be implicitly assigned to plain bytes.
contract C {
    function f() public view {
        bytes32 a = sync_rng_b32();
        a;
    }
}
// ----
// TypeError 9574: (199-225): Type sbytes32 is not implicitly convertible to expected type bytes32.
