// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() internal view {
        sbytes32 key = sbytes32(bytes32(0));
        uint96 nonce = 0;
        bytes memory data = new bytes(16);
        bytes memory encrypted = aes_gcm_encrypt(key, nonce, data);
        bytes memory decrypted = aes_gcm_decrypt(key, nonce, encrypted);
        decrypted;
    }
}
// ----
