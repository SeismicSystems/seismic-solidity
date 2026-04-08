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
// optimize: false
// ====
// ----
// seismicRng() -> 0x942f21b7e7babd30e758dc40c7310361ad6650ba3571e992ec958a8560a5b0b6
// seismicRng() -> 0x942f21b7e7babd30e758dc40c7310361ad6650ba3571e992ec958a8560a5b0b6
