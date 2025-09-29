// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

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

    // check that timestamp equal to timestamp_seconds
    function checkTimestampEqualTimestampSeconds() public view returns (bool) {
        return block.timestamp == block.timestamp_seconds;
    }

    // check that timestamp ms 1000 times greater than timestamp
    // lose precision due to integer divison when getting timestamp
    // if run as only function, will pass with equals
    function checkTimestampMsGreaterThanTimestamp() public view returns (bool) {
        return block.timestamp_ms >= block.timestamp * 1000;
    }

    // check that ms are within the threshold of what is valid from start unix epoch
    function checkTimestampMsValid() public view returns (bool) {
        return block.timestamp_ms >= 1000000000000;
    }

}
// ----
// getTimestamp() -> 0x0f
// getTimestampMs() -> 0x3aa7
// getTimestampSeconds() -> 0x0f
// checkTimestampEqualTimestampSeconds() -> true
// checkTimestampMsGreaterThanTimestamp() -> true
// checkTimestampMsValid() -> false
