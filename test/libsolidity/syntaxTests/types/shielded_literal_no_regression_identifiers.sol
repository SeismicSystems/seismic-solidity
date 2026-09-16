// Ensure that identifiers ending in 's' are not mistakenly treated as shielded literals.
contract C {
    uint256 public items;
    uint256 public blocks;
    uint256 public results;

    function setValues(uint256 _items, uint256 _blocks) public {
        items = _items;
        blocks = _blocks;
        results = _items + _blocks;
    }

    function getResults() public view returns (uint256) {
        return results;
    }

    // Single-letter 's' as identifier
    function withLocalS() public pure returns (uint256) {
        uint256 s = 42;
        return s;
    }

    // Variable named 'seconds' (without the space)
    function withSeconds() public pure returns (uint256) {
        uint256 secs = 60;
        return secs;
    }
}
// ----
