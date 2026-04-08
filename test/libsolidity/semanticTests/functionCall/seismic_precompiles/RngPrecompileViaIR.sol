// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SEISMICRNG {
    function seismicRng() public view returns (bytes memory) {
        address rngPrecompile = address(0x64);

        // Call the precompile
        (bool success, bytes memory output) = rngPrecompile.staticcall(abi.encodePacked(uint32(32)));
        // Ensure the call was successful
        require(success, "RNG Precompile call failed");

        assembly {
            let len := mload(output)
            let data := add(output, 32)
            return(data, len)
        }
    }

    function seismicRngPers(bytes32 pers) public view returns (bytes memory) {
        address rngPrecompile = address(0x64);

        bytes memory input = bytes.concat(pers);

        // Call the precompile
        (bool success, bytes memory output) = rngPrecompile.staticcall(abi.encodePacked(uint32(32),input));

        // Ensure the call was successful
        require(success, "RNG Precompile call failed");

        assembly {
            let len := mload(output)
            let data := add(output, 32)
            return(data, len)
        }

    }
}
// ====
// EVMVersion: >=mercury
// compileViaYul: true
// optimize: false
// ====
// ----
// seismicRng() -> 0x91a2ab5586137acbcfa7e12098c832d2f11fd8051c68d702e9b62b8d9f9895c1
// seismicRng() -> 0x91a2ab5586137acbcfa7e12098c832d2f11fd8051c68d702e9b62b8d9f9895c1
// seismicRngPers(bytes32): 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef -> 0x98fa567007bd70734b07d2238e448093020f1f717426ea85109a1fd7e1507e05
