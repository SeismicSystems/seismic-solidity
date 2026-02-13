contract C {
    sbytes a;
    sbytes b;

    function test() public returns (bool) {
        // Fill a
        a.push(sbytes1(0x11));
        a.push(sbytes1(0x22));
        a.push(sbytes1(0x33));

        // Copy a to b
        b = a;

        // Verify b has same content
        require(uint256(suint256(b.length)) == 3);
        require(b[0] == sbytes1(0x11));
        require(b[1] == sbytes1(0x22));
        require(b[2] == sbytes1(0x33));

        // Modify a, verify b is independent
        a[0] = sbytes1(0xFF);
        require(b[0] == sbytes1(0x11));

        return true;
    }
}
// ----
// test() -> true
