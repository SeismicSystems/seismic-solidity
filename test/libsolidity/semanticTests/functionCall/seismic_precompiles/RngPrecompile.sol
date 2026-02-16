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
// ====
// ----
// seismicRng() -> 0xde6078a23295753e0223fae218f0713b0e8066a2152b0d37b7a63f800c95e333
// seismicRng() -> 0xde6078a23295753e0223fae218f0713b0e8066a2152b0d37b7a63f800c95e333 
// seismicRngPers(bytes32): 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef -> 0x75fa8226f64596e3a8bd64b3c1e2aefecb8248e2203551139bacbc64447b69ac 
