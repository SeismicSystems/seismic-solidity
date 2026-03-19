// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    function getBaseRng() internal view returns (suint256) {
        return unsafe_rng_u256();
    }
}

contract Derived is Base {
    function testInheritedRng() public view returns (bool) {
        uint256 val = uint256(getBaseRng());
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testInheritedRng() -> true
