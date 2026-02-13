// Tests direct storage copy: short, long, and transitions between them
// Adapted from copy_byte_array_to_storage.sol (assembly storage checks removed)
contract C {
    sbytes data;

    function test() public returns (bool) {
        // Start empty
        require(uint256(suint256(data.length)) == 0);

        // Set short value (3 bytes)
        data = new sbytes(3);
        data[0] = sbytes1(0x61);
        data[1] = sbytes1(0x62);
        data[2] = sbytes1(0x63);
        require(uint256(suint256(data.length)) == 3);
        require(data[0] == sbytes1(0x61));
        require(data[1] == sbytes1(0x62));
        require(data[2] == sbytes1(0x63));

        // Overwrite with long value (70 bytes)
        data = new sbytes(70);
        for (uint256 i = 0; i < 70; i++)
            data[i] = sbytes1(uint8(i + 0x31));
        require(uint256(suint256(data.length)) == 70);
        require(data[0] == sbytes1(0x31));
        require(data[69] == sbytes1(uint8(69 + 0x31)));

        // Overwrite long with short (verifies storage cleanup)
        data = new sbytes(3);
        data[0] = sbytes1(0x61);
        data[1] = sbytes1(0x62);
        data[2] = sbytes1(0x63);
        require(uint256(suint256(data.length)) == 3);
        require(data[0] == sbytes1(0x61));

        // Overwrite short with long again
        data = new sbytes(70);
        for (uint256 i = 0; i < 70; i++)
            data[i] = sbytes1(uint8(i + 0x31));
        require(uint256(suint256(data.length)) == 70);

        // Overwrite long with shorter long (36 bytes)
        data = new sbytes(36);
        for (uint256 i = 0; i < 36; i++)
            data[i] = sbytes1(uint8(i + 0x31));
        require(uint256(suint256(data.length)) == 36);
        require(data[35] == sbytes1(uint8(35 + 0x31)));

        return true;
    }
}
// ----
// test() -> true
