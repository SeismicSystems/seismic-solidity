contract C {
    suint256[] private arr;
    suint8[3] private fixed_arr;

    function testPush() public returns (uint256) {
        arr.push(42s);
        return uint(arr[0]);
    }

    function testMultiplePush() public returns (uint256, uint256, uint256) {
        arr.push(10s);
        arr.push(20s);
        arr.push(30s);
        // arr[0] is 42 from testPush; indices 1,2,3 are from this call
        return (uint(arr[1]), uint(arr[2]), uint(arr[3]));
    }

    function testFixedArray() public returns (uint256, uint256, uint256) {
        fixed_arr[0] = 1s;
        fixed_arr[1] = 2s;
        fixed_arr[2] = 255s;
        return (uint(uint8(fixed_arr[0])), uint(uint8(fixed_arr[1])), uint(uint8(fixed_arr[2])));
    }
}
// ----
// testPush() -> 42
// testMultiplePush() -> 10, 20, 30
// testFixedArray() -> 1, 2, 255
