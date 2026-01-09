contract C {
    function f() public view returns (uint256 x) {
        assembly {
            x := timestamp()
        }
    }
}
// ----
// Warning 9328: (100-111): "timestamp()" can be influenced by block producers and should not be relied upon as a source of randomness.

