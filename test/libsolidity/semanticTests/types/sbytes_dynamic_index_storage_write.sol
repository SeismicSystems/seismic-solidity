// Tests writing at boundary indices (30, 31, 32) in storage
// Adapted from bytes_index_access.sol storageWrite portion (compound |= skipped)
contract C {
    sbytes data;

    function storageWrite() external returns (bool) {
        data = new sbytes(35);
        data[31] = sbytes1(0x77);
        data[32] = sbytes1(0x14);

        // Overwrite values
        data[31] = sbytes1(0x01);
        data[30] = sbytes1(0x01);
        data[32] = sbytes1(0x03);

        require(data[30] == sbytes1(0x01));
        require(data[31] == sbytes1(0x01));
        require(data[32] == sbytes1(0x03));

        // Verify other elements remain zero
        require(data[0] == sbytes1(0x00));
        require(data[29] == sbytes1(0x00));
        require(data[33] == sbytes1(0x00));

        return true;
    }
}
// ----
// storageWrite() -> true
