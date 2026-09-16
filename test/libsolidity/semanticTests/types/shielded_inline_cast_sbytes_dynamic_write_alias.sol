// Writing through a bytes alias to shielded storage must keep using shielded storage ops.
contract C {
    sbytes private data;

    function setup() public {
        data.push(sbytes1(0xAA));
        data.push(sbytes1(0xBB));
    }

    function readAlias() public view returns (bytes memory) {
        bytes storage ref = bytes(data);
        return ref;
    }

    function readAliasAt(uint256 i) public view returns (bytes1) {
        bytes storage ref = bytes(data);
        return ref[i];
    }

    function pushThroughAlias() public {
        bytes storage ref = bytes(data);
        ref.push(0xCC);
    }

    function readDirect() public view returns (bytes memory) {
        sbytes memory v = data;
        return bytes(v);
    }
}
// ----
// setup() ->
// readDirect() -> 0x20, 2, left(0xaabb)
// readAlias() -> 0x20, 2, left(0xaabb)
// readAliasAt(uint256): 0 -> left(0xaa)
// readAliasAt(uint256): 1 -> left(0xbb)
// pushThroughAlias() ->
// readDirect() -> 0x20, 3, left(0xaabbcc)
// readAliasAt(uint256): 2 -> left(0xcc)
