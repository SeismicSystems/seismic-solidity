// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AES {
    bytes32 public constant AES_KEY = hex"00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff";
    bytes public constant PLAINTEXT = hex"0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f";

    suint96 NONCE;
    bytes public encryptedData;
    bytes public decryptedData;

    /// @notice Generates a random nonce using seismicRng.
    function updateNonce() public {
        bytes32 rngOutput = seismicRng();
        NONCE = suint96(suint256(rngOutput)); 
    }


    /// @notice Encrypts the hardcoded plaintext and stores the ciphertext in storage.
    function encryptAndStore() public {
        address AESEncryptAddr = address(0x66);

        bytes memory input = abi.encodePacked(AES_KEY, NONCE, PLAINTEXT);

        (bool success, bytes memory output) = AESEncryptAddr.staticcall(input);
        require(success, "Precompile encryption call failed");

        encryptedData = output;
    }

    /// @notice Decrypts the previously stored ciphertext and verifies it matches the original plaintext.
    function decryptAndVerify() public {
        require(encryptedData.length > 0, "No encrypted data available");

        address AESDecryptAddr = address(0x67);

        bytes memory input = abi.encodePacked(AES_KEY, NONCE, encryptedData);

        (bool success, bytes memory output) = AESDecryptAddr.staticcall(input);
        require(success, "Precompile decryption call failed");

        decryptedData = output;

        require(keccak256(decryptedData) == keccak256(PLAINTEXT), "Decrypted data does not match plaintext");
    }

    function seismicRng() public view returns (bytes32) {
         address rngPrecompile = address(0x64);

         bytes memory input = abi.encodePacked(uint32(32));

         // Call the precompile
         (bool success, bytes memory output) = rngPrecompile.staticcall(input);
         require(success, "RNG Precompile call failed");

         bytes32 output32;
         assembly {
             output32 := mload(add(output, 32))
         }

         return output32;
     }

    function testEndToEnd() public {
        updateNonce();
        encryptAndStore();
        decryptAndVerify();
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// updateNonce() 
// encryptAndStore()  
// decryptAndVerify()
