// Tests sbytes1 == and != comparisons producing sbool
contract C {
    sbytes data;

    function test() public returns (bool) {
        data.push(sbytes1(0x42));
        data.push(sbytes1(0x43));
        data.push(sbytes1(0x42));

        // Equal comparison
        require(data[0] == sbytes1(0x42));
        require(data[0] == data[2]);

        // Not-equal comparison
        require(data[0] != sbytes1(0x43));
        require(data[0] != data[1]);

        return true;
    }
}
// ----
// test() -> true
