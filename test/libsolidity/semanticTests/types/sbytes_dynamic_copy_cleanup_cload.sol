// Tests that copying short sbytes over long sbytes clears old data slots
// Adapted from shielded_array_copy_clear_storage.sol
contract C {
    sbytes data;

    function test() public returns (bool) {
        // Write 70 bytes (long format: 3 data slots)
        data = new sbytes(70);
        for (uint256 i = 0; i < 70; i++)
            data[i] = sbytes1(uint8(i + 1));

        // Copy short array (1 element) over it
        sbytes memory short_arr = new sbytes(1);
        short_arr[0] = sbytes1(0x42);
        data = short_arr;

        // Verify length is correct
        require(uint256(suint256(data.length)) == 1);
        require(data[0] == sbytes1(0x42));

        // Verify old data area slots are zeroed via cload
        assembly {
            mstore(0, data.slot)
            let dataArea := keccak256(0, 0x20)
            // All old data slots should be zeroed since we transitioned to short format
            if iszero(eq(cload(dataArea), 0)) { revert(0, 0) }
            if iszero(eq(cload(add(dataArea, 1)), 0)) { revert(0, 0) }
            if iszero(eq(cload(add(dataArea, 2)), 0)) { revert(0, 0) }
        }
        return true;
    }
}
// ----
// test() -> true
