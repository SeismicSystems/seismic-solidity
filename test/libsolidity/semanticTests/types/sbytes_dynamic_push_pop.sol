contract C {
    sbytes data;

    function test() public returns (bool) {
        data.push(sbytes1(0x05));
        require(uint256(suint256(data.length)) == 1);
        require(data[0] == sbytes1(0x05));

        data.push(sbytes1(0x04));
        require(data[1] == sbytes1(0x04));

        data.push(sbytes1(0x03));
        require(uint256(suint256(data.length)) == 3);
        require(data[2] == sbytes1(0x03));

        data.pop();
        require(uint256(suint256(data.length)) == 2);

        data.pop();
        require(uint256(suint256(data.length)) == 1);
        require(data[0] == sbytes1(0x05));

        data.pop();
        require(uint256(suint256(data.length)) == 0);

        return true;
    }
}
// ----
// test() -> true
