// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Secp256k1SignBuiltin {
    // Verify the built-in matches the raw staticcall approach
    function testMatchesRawPrecompile() public view returns (bool) {
        sbytes32 sk = sbytes32(bytes32(uint256(1)));
        bytes32 msgHash = keccak256("hello");

        bytes memory builtinResult = secp256k1_sign(sk, msgHash);

        // Raw staticcall
        bytes memory input = abi.encodePacked(sk, msgHash);
        (bool success, bytes memory rawResult) = address(0x69).staticcall(input);
        require(success);

        return keccak256(builtinResult) == keccak256(rawResult);
    }

    // Test deterministic output
    function testDeterministic() public view returns (bool) {
        sbytes32 sk = sbytes32(bytes32(uint256(42)));
        bytes32 msgHash = keccak256("test");
        bytes memory a = secp256k1_sign(sk, msgHash);
        bytes memory b = secp256k1_sign(sk, msgHash);
        return keccak256(a) == keccak256(b);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testMatchesRawPrecompile() -> true
// testDeterministic() -> true
