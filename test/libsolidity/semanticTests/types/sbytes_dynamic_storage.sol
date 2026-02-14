contract C {
    sbytes data;

    function store() public {
        data.push(sbytes1(0xAA));
        data.push(sbytes1(0xBB));
        data.push(sbytes1(0xCC));
    }

    function verify() public returns (bool) {
        require(uint256(suint256(data.length)) == 3);
        require(data[0] == sbytes1(0xAA));
        require(data[1] == sbytes1(0xBB));
        require(data[2] == sbytes1(0xCC));
        return true;
    }
}
// ----
// store() ->
// verify() -> true
