contract c {
    suint256[] data;

    function test() public returns (uint256 x, uint256 l) {
        data.push(7);
        data.push(3);
        x = uint(data.length);
        data.pop();
        x = uint(data.length);
        data.pop();
        l = uint(data.length);
    }
}
// ----
// test() -> 1, 0

