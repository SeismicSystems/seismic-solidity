// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// TODO: add personalization test once unsafe_rng_u256_pers(...) is supported
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
}
// ====
// EVMVersion: >=mercury
// compileViaYul: false
// optimize: [200]
// ====
// ----
// seismicRng() -> 0x7f6ff9feff08393ef61c784b21e1a04bee92234d909b8308645c45048c7b732c
// seismicRng() -> 0x7f6ff9feff08393ef61c784b21e1a04bee92234d909b8308645c45048c7b732c
