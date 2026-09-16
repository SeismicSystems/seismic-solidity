// Tests that dirty memory bits beyond array length don't leak into storage
// Adapted from cleanup/byte_array_to_storage_cleanup.sol
contract C {
    sbytes s;

    function testClean() public returns (bool) {
        // Create 63-byte memory array, copy to storage, push empty byte
        sbytes memory m = new sbytes(63);
        s = m;
        s.push();
        // The 64th byte should be 0x00 (not garbage)
        require(s[63] == sbytes1(0x00));
        return true;
    }

    function testDirty() public returns (bool) {
        // Create bytes with dirty memory, convert to sbytes storage
        bytes memory m = new bytes(63);
        assembly {
            mstore8(add(m, add(32, 63)), 0x42) // dirty byte at position 63
        }
        // Copy to sbytes storage element by element
        delete s;
        for (uint256 i = 0; i < 63; i++)
            s.push(sbytes1(m[i]));
        s.push(); // push empty
        require(s[63] == sbytes1(0x00)); // must be clean
        return true;
    }
}
// ----
// testClean() -> true
// testDirty() -> true
