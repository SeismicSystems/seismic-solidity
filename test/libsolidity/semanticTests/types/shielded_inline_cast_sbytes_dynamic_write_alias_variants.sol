// Write variants through a bytes alias to shielded storage must keep using shielded storage ops.
contract C {
    sbytes private data;

    function setup() public {
        data.push(sbytes1(0xAA));
        data.push(sbytes1(0xBB));
        data.push(sbytes1(0xCC));
    }

    function indexWrite() public {
        bytes storage ref = bytes(data);
        ref[0] = 0xDD;
    }

    function popAlias() public {
        bytes storage ref = bytes(data);
        ref.pop();
    }

    function pushAfterPop() public {
        bytes storage ref = bytes(data);
        ref.push(0xEE);
    }

    function readAliasAt(uint256 i) public view returns (bytes1) {
        bytes storage ref = bytes(data);
        return ref[i];
    }

    function readDirect() public view returns (bytes memory) {
        sbytes memory v = data;
        return bytes(v);
    }
}
// ----
// setup() ->
// readDirect() -> 0x20, 3, left(0xaabbcc)
// indexWrite() ->
// readDirect() -> 0x20, 3, left(0xddbbcc)
// readAliasAt(uint256): 0 -> left(0xdd)
// readAliasAt(uint256): 2 -> left(0xcc)
// popAlias() ->
// readDirect() -> 0x20, 2, left(0xddbb)
// readAliasAt(uint256): 1 -> left(0xbb)
// pushAfterPop() ->
// readDirect() -> 0x20, 3, left(0xddbbee)
// readAliasAt(uint256): 2 -> left(0xee)
