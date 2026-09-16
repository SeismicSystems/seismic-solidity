// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Secp256k1Sign {
    address internal constant SIGN_PRECOMPILE = address(0x69);

    function sign(bytes32 sk, bytes32 message) internal view returns (bytes memory) {
        // Concatenate secret key, message
        bytes memory input = abi.encodePacked(sk, message);

        // Call the precompiled contract
        (bool success, bytes memory output) = SIGN_PRECOMPILE.staticcall(input);

        // Ensure the call was successful
        require(success, "Precompile call failed");

        return output;
    }

    function testRawSignature() public view returns (bytes memory) {
        bytes32 sk =      hex"0101010101010101010101010101010101010101010101010101010101010101";
        bytes32 message = hex"0101010101010101010101010101010101010101010101010101010101010101";
        return sign(sk, message);
    }

     function testEcrecover() public view returns (address) {
        bytes32 sk =      hex"0101010101010101010101010101010101010101010101010101010101010101";
        bytes32 message = hex"0101010101010101010101010101010101010101010101010101010101010101";
      

        // Simulate a precompiled contract returning a signature
        bytes memory signature = sign(sk, message);

        require(signature.length == 65, "Invalid signature length");

        // Extract r, s, v
        bytes32 r;
        bytes32 s;
        uint8 v;

        assembly {
            r := mload(add(signature, 32))  // Load first 32 bytes (r)
            s := mload(add(signature, 64))  // Load next 32 bytes (s)
            v := byte(0, mload(add(signature, 96))) // Load last byte (v)
        }

        // Ensure v is properly formatted (27 or 28)
        if (v < 27) {
            v += 27;
        }

        // Recover the signer address
        address recoveredAddress = ecrecover(message, v, r, s);
        return recoveredAddress;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testRawSignature() -> hex"00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000041c64b1924157748652733c41294e5f6e395c3626a8e911f3742a4b8ad4fdb922f347ba5cdd629027ef5846eb85c9452f6312e0aea697625d66b202448f3e9618f0000000000000000000000000000000000000000000000000000000000000000"
// testEcrecover() -> 0x1a642f0E3c3aF545E7AcBD38b07251B3990914F1