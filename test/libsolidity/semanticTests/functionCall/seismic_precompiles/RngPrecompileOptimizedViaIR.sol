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
// compileViaYul: true
// optimize: [200]
// ====
// ----
// seismicRng() -> 0x04b86619a869b3bd4f1ee805dbe95a27edf5f0f97b8b04300215a5ffec7d3d0c
// seismicRng() -> 0x04b86619a869b3bd4f1ee805dbe95a27edf5f0f97b8b04300215a5ffec7d3d0c
