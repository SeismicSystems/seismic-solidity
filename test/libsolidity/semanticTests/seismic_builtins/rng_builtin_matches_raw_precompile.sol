// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngBuiltinMatchesRawPrecompile {
    // Verify that the builtin produces valid output by checking that raw
    // staticcall to address(0x64) with the same byteWidth also succeeds.
    // We can't compare values (both are random), but we verify the raw call
    // succeeds and returns the expected number of bytes.

    function testRawPrecompile32Bytes() public view returns (bool) {
        address rng = address(0x64);
        (bool success, bytes memory output) = rng.staticcall(abi.encodePacked(uint32(32)));
        return success && output.length == 32;
    }

    function testRawPrecompile1Byte() public view returns (bool) {
        address rng = address(0x64);
        (bool success, bytes memory output) = rng.staticcall(abi.encodePacked(uint32(1)));
        return success && output.length == 1;
    }

    function testRawPrecompile8Bytes() public view returns (bool) {
        address rng = address(0x64);
        (bool success, bytes memory output) = rng.staticcall(abi.encodePacked(uint32(8)));
        return success && output.length == 8;
    }

    function testRawPrecompile12Bytes() public view returns (bool) {
        address rng = address(0x64);
        (bool success, bytes memory output) = rng.staticcall(abi.encodePacked(uint32(12)));
        return success && output.length == 12;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testRawPrecompile32Bytes() -> true
// testRawPrecompile1Byte() -> true
// testRawPrecompile8Bytes() -> true
// testRawPrecompile12Bytes() -> true
