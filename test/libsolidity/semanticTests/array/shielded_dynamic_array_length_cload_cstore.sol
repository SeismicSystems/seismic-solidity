// Verifies that dynamic shielded array length is stored with cload/cstore
contract C {
    suint[] data;

    function testCloadLength() public returns (uint256) {
        data.push(suint(10));
        data.push(suint(20));
        // Read length via cload in assembly
        uint256 len;
        assembly {
            len := cload(data.slot)
        }
        return len;
    }

    function testManualCstore() public returns (uint256) {
        // Manually set length via cstore
        assembly {
            cstore(data.slot, 3)
        }
        return uint256(data.length);
    }
}
// ====
// EVMVersion: >=Mercury
// ----
// testCloadLength() -> 2
// testManualCstore() -> 3
