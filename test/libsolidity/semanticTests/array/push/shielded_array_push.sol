contract c {
    suint256[] data;

    function test()
        public
        returns (uint256 x, uint256 y, uint256 z, uint256 l)
    {
        data.push(5);
        x = uint(data[0]);
        data.push(4);
        y = uint(data[1]);
        data.push(3);
        l = uint(data.length);
        z = uint(data[2]);
    }
}
// ----
// test() -> 5, 4, 3, 3
// gas irOptimized: 111834
// gas legacy: 111804
// gas legacyOptimized: 111122

