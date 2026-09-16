// Tests basic push/pop/push cycle with length tracking
// Adapted from byte_array_pop.sol
contract C {
    sbytes data;

    function test() public returns (uint256 x, uint256 y, uint256 l) {
        data.push(sbytes1(0x07));
        data.push(sbytes1(0x03));
        x = uint256(suint256(data.length));
        data.pop();
        data.pop();
        data.push(sbytes1(0x02));
        y = uint256(suint256(data.length));
        l = uint256(suint256(data.length));
    }
}
// ----
// test() -> 2, 1, 1
