// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() internal view {
        sbytes32 sk = sbytes32(bytes32(0));
        bytes memory pk = new bytes(33);
        bytes32 result = ecdh(sk, pk);
        result;
    }
}
// ----
