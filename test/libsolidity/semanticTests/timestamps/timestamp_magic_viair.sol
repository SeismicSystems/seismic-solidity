contract C {
    function checkTimestampEqualTimestampSeconds() public view returns (bool) {
        return block.timestamp == block.timestamp_seconds;
    }

    function checkTimestampMsGreater() public view returns (bool) {
        return block.timestamp_ms >= block.timestamp * 1000;
    }
}
// ====
// compileViaYul: also
// ----
// checkTimestampEqualTimestampSeconds() -> true
// checkTimestampMsGreater() -> true
