// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngInternalFunctionCall {
    function getSecret256() internal view returns (suint256) {
        return unsafe_rng_u256();
    }

    function getSecretB32() internal view returns (sbytes32) {
        return unsafe_rng_b32();
    }

    function testInternalCallInt() public view returns (bool) {
        uint256 val = uint256(getSecret256());
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }

    function testInternalCallBytes() public view returns (bool) {
        uint256 val = uint256(bytes32(getSecretB32()));
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testInternalCallInt() -> true
// testInternalCallBytes() -> true
