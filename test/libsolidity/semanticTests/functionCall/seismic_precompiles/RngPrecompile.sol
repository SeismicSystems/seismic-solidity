// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SEISMICRNG {
    function seismicRng() public view returns (uint256) {
        return uint256(unsafe_rng_u256());
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// seismicRng() -> 0xfc45f09fec6bfa9b89d01864356ac1113a504a717fb155a1b82dd5ef685feb8a
// seismicRng() -> 0xfc45f09fec6bfa9b89d01864356ac1113a504a717fb155a1b82dd5ef685feb8a
