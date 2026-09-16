// Array of mixed structs: push, pop, index access
contract C {
    struct Entry {
        uint32 id;
        suint256 value;
        sbool enabled;
    }

    Entry[] entries;

    function pushEntries() public {
        entries.push(Entry(1, suint256(100), sbool(true)));
        entries.push(Entry(2, suint256(200), sbool(false)));
        entries.push(Entry(3, suint256(300), sbool(true)));
    }

    function getEntry(uint256 i) public returns (uint32, uint256, bool) {
        Entry storage e = entries[i];
        return (e.id, uint256(e.value), bool(e.enabled));
    }

    function getLength() public returns (uint256) {
        return uint256(entries.length);
    }

    function popAndCheck() public returns (uint256 len, uint32 lastId, uint256 lastVal) {
        entries.pop();
        len = uint256(entries.length);
        Entry storage last = entries[len - 1];
        lastId = last.id;
        lastVal = uint256(last.value);
    }

    function modifyMiddle() public {
        entries[1].value = suint256(999);
        entries[1].enabled = sbool(true);
    }
}
// ----
// pushEntries() ->
// getLength() -> 3
// getEntry(uint256): 0 -> 1, 100, true
// getEntry(uint256): 1 -> 2, 200, false
// getEntry(uint256): 2 -> 3, 300, true
// modifyMiddle() ->
// getEntry(uint256): 1 -> 2, 999, true
// popAndCheck() -> 2, 2, 999
