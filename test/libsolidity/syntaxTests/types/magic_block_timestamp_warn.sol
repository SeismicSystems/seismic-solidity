contract C {
    function f() public view returns (uint256) {
        return block.timestamp;
    }
}
// ----
// Warning 9328: (77-92): "block.timestamp" can be influenced by block producers and should not be relied upon as a source of randomness.

