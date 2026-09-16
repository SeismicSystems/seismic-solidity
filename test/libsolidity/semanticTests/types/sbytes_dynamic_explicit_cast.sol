// Tests element-level conversions between bytes and sbytes at short and long lengths
// (Whole-array storage casts sbytes(bytesRef)/bytes(sbytesRef) reinterpret storage references
//  which doesn't work at runtime due to different storage encryption, so we test
//  element-by-element conversion instead)
contract C {
    bytes bdata;
    sbytes sdata;

    function testBytesToSbytesShort() public returns (bool) {
        delete bdata;
        bdata.push(0x41);
        bdata.push(0x42);
        bdata.push(0x43);
        bdata.push(0x44);
        bdata.push(0x45);

        // Convert element by element: bytes -> sbytes
        delete sdata;
        for (uint256 i = 0; i < bdata.length; i++)
            sdata.push(sbytes1(bdata[i]));

        require(uint256(suint256(sdata.length)) == 5);
        require(sdata[0] == sbytes1(0x41));
        require(sdata[4] == sbytes1(0x45));
        return true;
    }

    function testSbytesToBytesShort() public returns (bool) {
        delete sdata;
        sdata.push(sbytes1(0x41));
        sdata.push(sbytes1(0x42));
        sdata.push(sbytes1(0x43));

        // Convert element by element: sbytes -> bytes
        delete bdata;
        uint256 len = uint256(suint256(sdata.length));
        for (uint256 i = 0; i < len; i++)
            bdata.push(bytes1(sdata[i]));

        require(bdata.length == 3);
        require(bdata[0] == bytes1(0x41));
        require(bdata[2] == bytes1(0x43));
        return true;
    }

    function testRoundTripLong() public returns (bool) {
        // Build bytes storage (50 bytes) via push
        delete bdata;
        for (uint256 i = 0; i < 50; i++)
            bdata.push(bytes1(uint8(i)));

        // Convert to sbytes via allocation + index writes (avoids push transition issues)
        sdata = new sbytes(50);
        for (uint256 i = 0; i < 50; i++)
            sdata[i] = sbytes1(bdata[i]);

        require(uint256(suint256(sdata.length)) == 50);
        require(sdata[0] == sbytes1(0x00));
        require(sdata[49] == sbytes1(uint8(49)));

        // Convert back to bytes
        delete bdata;
        for (uint256 i = 0; i < 50; i++)
            bdata.push(bytes1(sdata[i]));

        require(bdata.length == 50);
        require(bdata[0] == bytes1(0x00));
        require(bdata[49] == bytes1(uint8(49)));

        return true;
    }
}
// ----
// testBytesToSbytesShort() -> true
// testSbytesToBytesShort() -> true
// testRoundTripLong() -> true
