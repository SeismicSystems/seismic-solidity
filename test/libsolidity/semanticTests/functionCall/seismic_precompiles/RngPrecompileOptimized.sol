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
// compileViaYul: false
// optimize: [200]
// ====
// ----
// seismicRng() -> 0x2c1793080aa8fd934f095e9f36ad1c8631d9587f8b1b839474f9c398f61a2472
// seismicRng() -> 0x2c1793080aa8fd934f095e9f36ad1c8631d9587f8b1b839474f9c398f61a2472
// seismicRngPers(bytes32): 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef -> 0x14922e3a836f3b28d9ade6eae514fed4e92b650ed6245116f78fef6638ca0f96
