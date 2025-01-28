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
// seismicRng() -> 0xfc45f09fec6bfa9b89d01864356ac1113a504a717fb155a1b82dd5ef685feb8a
// seismicRng() -> 0xfc45f09fec6bfa9b89d01864356ac1113a504a717fb155a1b82dd5ef685feb8a 
// seismicRngPers(bytes32): 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef -> 0xcde7fca4bbc86bcfb3acc70d4243e1aa67786379174b6056c8fc07f3572403da 
