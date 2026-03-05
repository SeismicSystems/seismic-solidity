contract C {
    sbytes data;

    function getLen() internal view returns (uint256) {
        return uint256(suint256(data.length));
    }

    function test() public returns (bool) {
        data.push(sbytes1(0xAA));
        data.push(sbytes1(0xBB));
        data.push(sbytes1(0xCC));
        require(getLen() == 3);

        delete data;
        require(getLen() == 0);

        // Can push again after delete
        data.push(sbytes1(0xDD));
        require(getLen() == 1);
        require(data[0] == sbytes1(0xDD));

        return true;
    }
}
// ----
// test() -> true
