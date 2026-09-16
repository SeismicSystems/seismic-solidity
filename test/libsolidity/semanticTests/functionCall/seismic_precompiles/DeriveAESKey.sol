// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DERIVEAESKEY {
    /// @notice Derives an AES key using a precompiled contract.
    /// @param sk The secret key as 32 bytes.
    /// @param pk The public key as 33 bytes.
    /// @return result The derived AES key as bytes32.
    function deriveAESKey(bytes32 sk, bytes memory pk) public view returns (bytes32 result) {
        // Address of the precompiled contract
        address deriveAESKeyPrecompile = address(0x65);

        // Concatenate secret key and public key
        bytes memory input = abi.encodePacked(sk, pk);

        // Call the precompiled contract
        (bool success, bytes memory output) = deriveAESKeyPrecompile.staticcall(input);

        // Ensure the call was successful
        require(success, "Precompile call failed");

        // Decode the result
        require(output.length == 32, "Invalid output length");
        assembly {
            result := mload(add(output, 32))
        }
    }

    function testDeriveAESKey() public view {
        // Define the secret keys (sk) and public keys (pk) as hexadecimal literals
        bytes32 sk1 = hex"7e38022030c40773cc561c1cc9c0053e48b0be2cee33c13495f096942ea176ef";
        bytes memory pk1 = hex"03f176e697b5b0c4799f1816f5fe114263d1c01a84ad296129f994278499f0842e";
        bytes32 sk2 = hex"adbed354135e517bc881d55fa60c455737d1ba98d446c0866cec3837e13d9906";
        bytes memory pk2 = hex"02555d7b94d8afc4afdf5a03e9da73a408b6d19c865036bae833864d2353e85a25";

        // Create inputs by concatenating secret keys and public keys
        bytes32 result_a = deriveAESKey(sk1, pk2);
        bytes32 result_b = deriveAESKey(sk2, pk1);

        // Assert that the results are equal
        assembly {
            if iszero(eq(result_a, result_b)) {
                mstore(0x00, "Derived AES keys do not match")
                revert(0x00, 0x20) // 0x20 = 32 bytes for the error message
            }
        }
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testDeriveAESKey()
