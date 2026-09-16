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
// optimize: false
// ====
// ----
// seismicRng() -> 0x99f6d8e691c997206aaa1aeb7679ddf6d7c61136820c2dcf4433930370146ea4
// seismicRng() -> 0x99f6d8e691c997206aaa1aeb7679ddf6d7c61136820c2dcf4433930370146ea4
// seismicRngPers(bytes32): 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef -> 0xecb6e97c616743b8d6ed6a5a03bd39cf03a2659fcb1ef71412e94ffaf3fb3b1f
