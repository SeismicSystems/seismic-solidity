contract c {
    suint256[] data;

    function test()
        public
        returns (uint256 x, uint256 y, uint256 z, uint256 l)
    {
        data.push(suint(5));
        x = uint(data[suint(0)]);
        data.push(suint(4));
        y = uint(data[suint(1)]);
        data.push(suint(3));
        l = uint(data.length);
        z = uint(data[suint(2)]);
    }
}
// ----
// test() -> 5, 4, 3, 3
// gas irOptimized: 111834
// gas legacy: 111804
// gas legacyOptimized: 111122

