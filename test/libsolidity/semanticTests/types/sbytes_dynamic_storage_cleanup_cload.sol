// Tests that long->short sbytes transitions zero old data slots
// Adapted from shielded_array_storage_index_zeroed_test.sol pattern
contract C {
    sbytes data;

    function test() public returns (bool) {
        // Write 70 bytes (long format: 3 data slots at keccak256(slot))
        data = new sbytes(70);
        for (uint256 i = 0; i < 70; i++)
            data[i] = sbytes1(uint8(i + 1));

        // Overwrite with 3 bytes (short format: inline in header slot)
        data = new sbytes(3);
        data[0] = sbytes1(0x41);
        data[1] = sbytes1(0x42);
        data[2] = sbytes1(0x43);

        // Verify old long-format data slots are zeroed via cload
        assembly {
            mstore(0, data.slot)
            let dataArea := keccak256(0, 0x20)
            // Slots 0, 1, 2 should be zeroed (were used by 70-byte array)
            if iszero(eq(cload(dataArea), 0)) { revert(0, 0) }
            if iszero(eq(cload(add(dataArea, 1)), 0)) { revert(0, 0) }
            if iszero(eq(cload(add(dataArea, 2)), 0)) { revert(0, 0) }
        }

        // Verify the short data is correct
        require(uint256(suint256(data.length)) == 3);
        require(data[0] == sbytes1(0x41));
        return true;
    }
}
// ----
// test() -> true
