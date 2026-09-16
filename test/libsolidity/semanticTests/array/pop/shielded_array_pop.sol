contract c {
    suint256[] data;

    function test() public returns (uint256 x, uint256 l) {
        data.push(suint(7));
        data.push(suint(3));
        x = uint(data.length);
        data.pop();
        x = uint(data.length);
        data.pop();
        l = uint(data.length);
    }
}
// ----
// test() -> 1, 0

