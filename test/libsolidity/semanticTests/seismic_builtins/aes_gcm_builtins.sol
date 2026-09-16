// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AESGCMBuiltins {
    // Test encrypt then decrypt round-trip
    function testRoundTrip() public view returns (bool) {
        sbytes32 key = sbytes32(hex"00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff");
        uint96 nonce = 17;
        bytes memory plaintext = hex"0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f";

        bytes memory ciphertext = aes_gcm_encrypt(key, nonce, plaintext);
        bytes memory decrypted = aes_gcm_decrypt(key, nonce, ciphertext);

        return keccak256(decrypted) == keccak256(plaintext);
    }

    // Verify the built-in encrypt matches raw staticcall
    function testEncryptMatchesRawPrecompile() public view returns (bool) {
        sbytes32 key = sbytes32(hex"00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff");
        uint96 nonce = 17;
        bytes memory plaintext = hex"0102030405060708090a0b0c0d0e0f10";

        bytes memory builtinResult = aes_gcm_encrypt(key, nonce, plaintext);

        // Raw staticcall
        (bool success, bytes memory rawResult) = address(0x66).staticcall(abi.encodePacked(bytes32(key), nonce, plaintext));
        require(success);

        return keccak256(builtinResult) == keccak256(rawResult);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testRoundTrip() -> true
// testEncryptMatchesRawPrecompile() -> true
