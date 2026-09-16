// Long byte-array aliases must keep using shielded storage ops for reads and writes too.
contract C {
    sbytes private data;

    function setup() public {
        for (uint256 i = 0; i < 32; ++i)
            data.push(sbytes1(bytes1(uint8(i + 1))));
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
        ref.push(0x21);
    }

    function readDirect() public view returns (bytes memory) {
        sbytes memory v = data;
        return bytes(v);
    }
}
// ----
// setup() ->
// readDirect() -> 0x20, 32, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
// readAlias() -> 0x20, 32, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
// readAliasAt(uint256): 0 -> left(0x01)
// readAliasAt(uint256): 31 -> left(0x20)
// pushThroughAlias() ->
// readDirect() -> 0x20, 33, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20, left(0x21)
// readAlias() -> 0x20, 33, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20, left(0x21)
// readAliasAt(uint256): 32 -> left(0x21)
