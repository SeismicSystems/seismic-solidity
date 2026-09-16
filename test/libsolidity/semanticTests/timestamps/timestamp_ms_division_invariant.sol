// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Verify that block.timestamp_ms / 1000 == block.timestamp
// and block.timestamp_seconds == block.timestamp within a single call.
contract C {
    function checkMsDivisionEqualsTimestamp() public view returns (bool) {
        return block.timestamp_ms / 1000 == block.timestamp;
    }

    function checkSecondsEqualsTimestamp() public view returns (bool) {
        return block.timestamp_seconds == block.timestamp;
    }

    function checkAllConsistent() public view returns (bool) {
        uint256 ts = block.timestamp;
        uint256 tsMs = block.timestamp_ms;
        uint256 tsSec = block.timestamp_seconds;
        return (tsMs / 1000 == ts) && (tsSec == ts);
    }
}
// ====
// compileViaYul: also
// ----
// checkMsDivisionEqualsTimestamp() -> true
// checkSecondsEqualsTimestamp() -> true
// checkAllConsistent() -> true
