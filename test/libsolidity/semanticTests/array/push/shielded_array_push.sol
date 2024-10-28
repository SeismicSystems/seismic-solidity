contract c {
    suint256[] data;

    function test()
        public
        returns (suint256 x, suint256 y, suint256 z, suint256 l)
    {
        data.push(5);
        x = data[0];
        data.push(4);
        y = data[1];
        data.push(3);
        l = data.length;
        z = data[2];
    }
}
// ----
// test() -> 5, 4, 3, 3
// gas irOptimized: 111834
// gas legacy: 111804
// gas legacyOptimized: 111122

