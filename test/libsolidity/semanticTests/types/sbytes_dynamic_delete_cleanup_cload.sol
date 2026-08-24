// Tests that delete sbytes zeros both header and data slots
// Adapted from delete_bytes_array.sol + shielded_array_copy_clear_storage.sol
contract C {
    sbytes data;

    function test() public returns (bool) {
        // Write 70 bytes (long format)
        data = new sbytes(70);
        for (uint256 i = 0; i < 70; i++)
            data[i] = sbytes1(uint8(i));

        delete data;

        // Verify header slot is zeroed
        uint256 headerVal;
        assembly { headerVal := cload(data.slot) }
        require(headerVal == 0);

        // Verify data area slots are zeroed
        assembly {
            mstore(0, data.slot)
            let dataArea := keccak256(0, 0x20)
            if iszero(eq(cload(dataArea), 0)) { revert(0, 0) }
            if iszero(eq(cload(add(dataArea, 1)), 0)) { revert(0, 0) }
            if iszero(eq(cload(add(dataArea, 2)), 0)) { revert(0, 0) }
        }
        return true;
    }
}
// ----
// test() -> true
