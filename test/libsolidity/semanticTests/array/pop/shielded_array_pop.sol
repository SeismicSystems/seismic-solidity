contract c {
    suint256[] data;

    function test() public returns (suint256 x, suint256 l) {
        data.push(7);
        data.push(3);
        x = data.length;
        data.pop();
        x = data.length;
        data.pop();
        l = data.length;
    }
}
// ----
// test() -> 1, 0

