// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title AESLogger
 * @dev This contract demonstrates how to:
 *      - Allow anyone to submit a plaintext message for encryption,
 *      - Generate a fresh random nonce for each submission,
 *      - Emit an event containing {nonce, ciphertext},
 *      - Provide a function (owner-only) to decrypt a given nonce & ciphertext on-chain.
 *
 * Precompile Addresses:
 *  - RNG         at 0x64
 *  - AESEncrypt  at 0x66
 *  - AESDecrypt  at 0x67
 */
contract AESLogger {
    // -----------------------------------------------------------------------------------------
    // Storage
    // -----------------------------------------------------------------------------------------
    address public owner;

    suint256 AES_KEY;

    event EncryptedMessage(
        uint96 indexed nonce,
        bytes ciphertext
    );

    // -----------------------------------------------------------------------------------------
    // Constructor & Modifiers
    // -----------------------------------------------------------------------------------------
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // -----------------------------------------------------------------------------------------
    // Owner-Only Functions
    // -----------------------------------------------------------------------------------------

    /**
     * @notice Set a new AES key (suint256). Only the owner can update the key.
     */
    function setAESKey(suint256 _aesKey) external onlyOwner {
        AES_KEY = _aesKey;
    }

    /**
     * @notice Decrypt a given nonce & ciphertext on-chain. Only the owner can call this.
     * @param nonce       Random nonce that was used during encryption.
     * @param ciphertext  The ciphertext from the `EncryptedMessage` event.
     * @return plaintext  The decrypted result.
     */
    function decrypt(
        uint96 nonce,
        bytes calldata ciphertext
    ) external view onlyOwner returns (bytes memory plaintext) {
        require(ciphertext.length > 0, "Ciphertext cannot be empty");

        address AESDecryptAddr = address(0x67);
        // Pack key, nonce, and ciphertext
        bytes memory input = abi.encodePacked(AES_KEY, nonce, ciphertext);

        (bool success, bytes memory output) = AESDecryptAddr.staticcall(input);
        require(success, "AES decrypt precompile call failed");

        return output;
    }
    // -----------------------------------------------------------------------------------------
    // Public Function
    // -----------------------------------------------------------------------------------------

    /**
     * @notice Allows anyone to submit a plaintext message, which is encrypted under the stored AES_KEY.
     * @param plaintext The bytes to encrypt.
     */
    function submitMessage(bytes calldata plaintext) external {
        uint96 nonce = _generateRandomNonce();
        bytes memory ciphertext = _encrypt(nonce, plaintext);
        emit EncryptedMessage(nonce, abi.encodePacked(ciphertext));
    }

    // -----------------------------------------------------------------------------------------
    // Internal Helpers
    // -----------------------------------------------------------------------------------------

    /**
     * @dev Calls the RNG precompile to get a random nonce.
     */
    function _generateRandomNonce() internal view returns (uint96) {
        address rngPrecompile = address(0x64);

        (bool success, bytes memory output) = rngPrecompile.staticcall(abi.encodePacked(uint32(32)));
        require(success, "RNG Precompile call failed");

        bytes32 randomBytes;
        assembly {
            randomBytes := mload(add(output, 32))
        }

        return uint96(uint256(randomBytes));
    }

    /**
     * @dev Encrypts the given plaintext with {AES_KEY, nonce} using the AES encryption precompile at 0x67.
     */
    function _encrypt(
        uint96 nonce,
        bytes memory plaintext
    ) internal view returns (bytes memory ciphertext) {
        address AESEncryptAddr = address(0x66);
        bytes memory input = abi.encodePacked(AES_KEY, nonce, plaintext);

        (bool success, bytes memory output) = AESEncryptAddr.staticcall(input);
        require(success, "AES encrypt precompile call failed");
        require(output.length > 0, "Encryption call returned no output");

        return output;
    }
}
