// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SEISMICRNG {
    function seismicRNG() public view returns (bytes32  result) {
        address rngPrecompile = address(0x64);

        bytes memory input = bytes.concat(bytes1(0x11));

        // Call the precompile
        (bool success, bytes memory output) = rngPrecompile.staticcall(input);
        assert(success);

        assembly {
            result := mload(add(output, 32))
        }
        // Ensure the call was successful
        require(success, "RNG Precompile call failed");
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// seismicRNG() -> 1
