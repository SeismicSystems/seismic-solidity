// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HKDFBuiltin {
    // Verify the built-in matches the raw staticcall approach
    function testMatchesRawPrecompile() public view returns (bool) {
        bytes memory input = hex"0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20";

        bytes32 builtinResult = hkdf(input);

        // Raw staticcall
        (bool success, bytes memory output) = address(0x68).staticcall(input);
        require(success);
        bytes32 rawResult;
        assembly { rawResult := mload(add(output, 32)) }

        return builtinResult == rawResult;
    }

    // Test deterministic output
    function testDeterministic() public view returns (bool) {
        bytes memory input = hex"deadbeef";
        bytes32 a = hkdf(input);
        bytes32 b = hkdf(input);
        return a == b;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testMatchesRawPrecompile() -> true
// testDeterministic() -> true
