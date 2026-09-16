contract C {
    function f() public view returns (uint256 ts, uint256 tsMs) {
        assembly {
            ts := timestamp()
            tsMs := timestampms()
        }
    }
}
// ----
