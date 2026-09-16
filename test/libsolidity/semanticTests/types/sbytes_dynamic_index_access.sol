contract C {
    sbytes data;

    function testWrite() public returns (bool) {
        // Allocate space via push
        data.push(sbytes1(0x00));
        data.push(sbytes1(0x00));
        data.push(sbytes1(0x00));

        // Write via index
        data[0] = sbytes1(0x11);
        data[1] = sbytes1(0x22);
        data[2] = sbytes1(0x33);

        // Read back
        require(data[0] == sbytes1(0x11));
        require(data[1] == sbytes1(0x22));
        require(data[2] == sbytes1(0x33));

        // Overwrite
        data[1] = sbytes1(0xFF);
        require(data[1] == sbytes1(0xFF));
        require(data[0] == sbytes1(0x11));
        require(data[2] == sbytes1(0x33));

        return true;
    }
}
// ----
// testWrite() -> true
