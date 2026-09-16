// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Test that block.timestamp_seconds and block.timestamp_ms work correctly
// when compiled via the IR pipeline.
contract C {
    function getTimestamp() public view returns (uint256) {
        return block.timestamp;
    }

    function getTimestampMs() public view returns (uint256) {
        return block.timestamp_ms;
    }

    function getTimestampSeconds() public view returns (uint256) {
        return block.timestamp_seconds;
    }

    function checkTimestampEqualTimestampSeconds() public view returns (bool) {
        return block.timestamp == block.timestamp_seconds;
    }

    function checkTimestampMsGreaterThanTimestamp() public view returns (bool) {
        return block.timestamp_ms >= block.timestamp * 1000;
    }
}
// ====
// compileViaYul: true
// ----
// getTimestamp() -> 0x0f
// getTimestampMs() -> 0x7530
// getTimestampSeconds() -> 0x2d
// checkTimestampEqualTimestampSeconds() -> true
// checkTimestampMsGreaterThanTimestamp() -> true
