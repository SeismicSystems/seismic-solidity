// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngBuiltins {
    function testRng256() public view returns (suint256) {
        return rng256();
    }

    function testRng128() public view returns (suint128) {
        return rng128();
    }

    function testRng64() public view returns (suint64) {
        return rng64();
    }

    function testRng32() public view returns (suint32) {
        return rng32();
    }

    function testRng16() public view returns (suint16) {
        return rng16();
    }

    function testRng8() public view returns (suint8) {
        return rng8();
    }

    // Verify rng256() matches the existing raw staticcall RNG precompile output
    function testRng256MatchesRawPrecompile() public view returns (bool) {
        suint256 builtin = rng256();
        // Raw staticcall to RNG precompile
        address rngPrecompile = address(0x64);
        (bool success, bytes memory output) = rngPrecompile.staticcall(abi.encodePacked(uint32(32)));
        require(success, "RNG precompile call failed");
        bytes32 rawResult;
        assembly {
            rawResult := mload(add(output, 32))
        }
        return builtin == suint256(rawResult);
    }

    // Test multiple calls return the same value (deterministic in test env)
    function testDeterministic() public view returns (bool) {
        suint256 a = rng256();
        suint256 b = rng256();
        return a == b;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testRng256() -> 0xfc45f09fec6bfa9b89d01864356ac1113a504a717fb155a1b82dd5ef685feb8a
// testRng128() -> 0x00000000000000000000000000000000fc45f09fec6bfa9b89d01864356ac111
// testRng64() -> 0x00000000000000000000000000000000000000000000000000000000fc45f09f
// testRng32() -> 0x00000000000000000000000000000000000000000000000000000000fc45f09f
// testRng16() -> 0x000000000000000000000000000000000000000000000000000000000000fc45
// testRng8() -> 0x00000000000000000000000000000000000000000000000000000000000000fc
// testRng256MatchesRawPrecompile() -> true
// testDeterministic() -> true
