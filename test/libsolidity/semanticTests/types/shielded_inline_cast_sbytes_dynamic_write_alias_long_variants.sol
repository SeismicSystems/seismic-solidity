// Long byte-array alias operations must keep using shielded storage ops for element updates too.
contract C {
    sbytes private data;

    function setup() public {
        for (uint256 i = 0; i < 33; ++i)
            data.push(sbytes1(bytes1(uint8(i + 1))));
    }

    function readAliasAt(uint256 i) public view returns (bytes1) {
        bytes storage ref = bytes(data);
        return ref[i];
    }

    function indexWriteAlias() public {
        bytes storage ref = bytes(data);
        ref[0] = 0xAA;
        ref[31] = 0xBB;
        ref[32] = 0xCC;
    }

    function popAlias() public {
        bytes storage ref = bytes(data);
        ref.pop();
    }

    function pushAfterPop() public {
        bytes storage ref = bytes(data);
        ref.push(0xDD);
    }

    function readDirect() public view returns (bytes memory) {
        sbytes memory v = data;
        return bytes(v);
    }
}
// ----
// setup() ->
// readAliasAt(uint256): 0 -> left(0x01)
// readAliasAt(uint256): 31 -> left(0x20)
// readAliasAt(uint256): 32 -> left(0x21)
// indexWriteAlias() ->
// readAliasAt(uint256): 0 -> left(0xaa)
// readAliasAt(uint256): 31 -> left(0xbb)
// readAliasAt(uint256): 32 -> left(0xcc)
// readDirect() -> 0x20, 33, 0xaa02030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1fbb, left(0xcc)
// popAlias() ->
// readDirect() -> 0x20, 32, 0xaa02030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1fbb
// pushAfterPop() ->
// readDirect() -> 0x20, 33, 0xaa02030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1fbb, left(0xdd)
// readAliasAt(uint256): 32 -> left(0xdd)
