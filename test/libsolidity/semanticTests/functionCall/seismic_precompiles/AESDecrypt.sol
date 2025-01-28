// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AESDECRYPT {
    function AESDecrypt(bytes32 aes_key, uint96 nonce, bytes memory ciphertext) public view returns (bytes memory) {
        // Address of the precompiled contract
        address AESDecryptAddr = address(0x67);

        // Concatenate secret key, nonce, and ciphertext
        bytes memory input = abi.encodePacked(aes_key, nonce, ciphertext);

        // Call the precompiled contract
        (bool success, bytes memory output) = AESDecryptAddr.staticcall(input);

        // Ensure the call was successful
        require(success, "Precompile call failed");

        // Copy the output into a new bytes array and return it
        bytes memory result = new bytes(output.length);
        assembly {
            let len := mload(output)
            let data := add(output, 32)

            // Copy the content of `output` into `result`
            for { let i := 0 } lt(i, len) { i := add(i, 32) } { mstore(add(result, add(32, i)), mload(add(data, i))) }

            // Set the length of the result
            mstore(result, len)
        }

        return result;
    }
    
    // in the test output, there are two 00 at the end, that's just solidity padding!
    function testAESDecrypt() public view returns (bytes memory result) {
        uint96 nonce = 17;
        bytes32 aes_key = hex"00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff";
        bytes memory ciphertext =
            hex"9915a626bc11d2f0bc37db72832936b6518c6b2e24a22467ba4259e03c1486f3e9110b69eb498f9213f11796b64b84eaabc145aaf209469a4d15698df70f0e8e98695496179a239d701803cfc922bd";
        result = AESDecrypt(aes_key, nonce, ciphertext);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testAESDecrypt() -> hex"0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000003f0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f00"
