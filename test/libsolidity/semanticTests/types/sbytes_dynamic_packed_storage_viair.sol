contract C {
    sbytes1[] s;

    function test() public returns (bool) {
        s.push(sbytes1(0x10));
        s.push(sbytes1(0x20));
        s.push(sbytes1(0x30));
        require(s[0] == sbytes1(0x10));
        require(s[1] == sbytes1(0x20));
        require(s[2] == sbytes1(0x30));
        return true;
    }

    function testUpdate() public returns (bool) {
        delete s;
        s.push(sbytes1(0x10));
        s.push(sbytes1(0x20));
        s.push(sbytes1(0x30));
        s[1] = sbytes1(0x99);
        require(s[0] == sbytes1(0x10));
        require(s[1] == sbytes1(0x99));
        require(s[2] == sbytes1(0x30));
        return true;
    }
}
// ====
// compileViaYul: also
// ----
// test() -> true
// testUpdate() -> true
