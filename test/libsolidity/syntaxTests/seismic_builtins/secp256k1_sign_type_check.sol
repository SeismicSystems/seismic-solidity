// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() internal view {
        sbytes32 sk = sbytes32(bytes32(uint256(1)));
        bytes32 msgHash = keccak256("hello");
        bytes memory result = secp256k1_sign(sk, msgHash);
        result;
    }
}
// ----
