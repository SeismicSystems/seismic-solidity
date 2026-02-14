contract C {
    sbytes s;

    function testCopy() public returns (bool) {
        s.push(sbytes1(0x61));
        s.push(sbytes1(0x62));
        s.push(sbytes1(0x63));

        sbytes memory m = s;
        require(uint256(suint256(m.length)) == 3);
        require(m[0] == sbytes1(0x61));
        require(m[1] == sbytes1(0x62));
        require(m[2] == sbytes1(0x63));
        return true;
    }
}
// ====
// compileViaYul: also
// ----
// testCopy() -> true
