
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AESENCRYPT {
    /// @notice Endcrypts the plaintext using AES-256 GCM with the provided key and nonce.
    /// @param aes_key The 32 bit AES-256 GCM key used for encryption.
    /// @param plaintext The bytes to encrypt.
    /// @param nonce the u64 nonce for encryption, encoded as a big-endian bytes32.
    /// returns the encrypted bytes.
    function AESEncrypt(bytes32 aes_key, uint96 nonce, bytes memory plaintext) public view returns (bytes memory) {
        // Address of the precompiled contract
        address AESEncryptAddr = address(0x66);

        // Concatenate secret key and public key
        bytes memory input = abi.encodePacked(aes_key, nonce, plaintext);

        // Call the precompiled contract
        (bool success, bytes memory output) = AESEncryptAddr.staticcall(input);

        // Ensure the call was successful
        require(success, "Precompile call failed");

        return output;
        
    }

    function testAESEncrypt() public view returns (bytes memory result) {
        uint96 nonce = 17;
        bytes32 aes_key = hex"00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff";
        bytes memory plaintext = hex"0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f";
        result = AESEncrypt(aes_key, nonce, plaintext);
    }   
    
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testAESEncrypt() -> hex"0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004f9915a626bc11d2f0bc37db72832936b6518c6b2e24a22467ba4259e03c1486f3e9110b69eb498f9213f11796b64b84eaabc145aaf209469a4d15698df70f0e8e98695496179a239d701803cfc922bd0000000000000000000000000000000000"
