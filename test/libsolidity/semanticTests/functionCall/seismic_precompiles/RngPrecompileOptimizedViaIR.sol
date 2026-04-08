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
// optimize: [200]
// ====
// ----
// seismicRng() -> 0x8bb8d0ffe2a5f12a2abfc327e1e74fb00aa4372f62265735672b465a84c008a3
// seismicRng() -> 0x8bb8d0ffe2a5f12a2abfc327e1e74fb00aa4372f62265735672b465a84c008a3
// seismicRngPers(bytes32): 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef -> 0xebfb5f5b7d38f1d958eeeeea1c8db975a74febab71ae4856474daa764641e1eb
