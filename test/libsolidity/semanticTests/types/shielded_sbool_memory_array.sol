contract C {
    function defaults() public pure returns (bool, bool, bool) {
        sbool[] memory arr = new sbool[](3);
        return (bool(arr[0]), bool(arr[1]), bool(arr[2]));
    }

    function writeAndRead(sbool a, sbool b, sbool c) public pure returns (bool, bool, bool) {
        sbool[] memory arr = new sbool[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return (bool(arr[0]), bool(arr[1]), bool(arr[2]));
    }
}
// ----
// defaults() -> false, false, false
// writeAndRead(sbool,sbool,sbool): true, false, true -> true, false, true
// writeAndRead(sbool,sbool,sbool): false, true, false -> false, true, false
