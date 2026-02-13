contract C {
    sbytes data;

    function getLen() internal view returns (uint256) {
        return uint256(suint256(data.length));
    }

    function test() public returns (bool) {
        require(getLen() == 0);

        data.push(sbytes1(0x01));
        require(getLen() == 1);

        data.push(sbytes1(0x02));
        require(getLen() == 2);

        for (uint i = 0; i < 10; i++) {
            data.push(sbytes1(uint8(0x10 + i)));
        }
        require(getLen() == 12);

        data.pop();
        require(getLen() == 11);

        return true;
    }
}
// ----
// test() -> true
