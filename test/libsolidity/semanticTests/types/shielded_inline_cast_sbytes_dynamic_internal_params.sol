// Internal helpers that take bytes storage aliases must preserve shielded storage ops.
contract C {
    sbytes private shortData;
    sbytes private longPushData;
    sbytes private longIndexData;

    function setup() public {
        shortData.push(sbytes1(0xAA));
        shortData.push(sbytes1(0xBB));

        for (uint256 i = 0; i < 32; ++i)
            longPushData.push(sbytes1(bytes1(uint8(i + 1))));

        for (uint256 i = 0; i < 33; ++i)
            longIndexData.push(sbytes1(bytes1(uint8(i + 1))));
    }

    function readAll(bytes storage ref) internal view returns (bytes memory) {
        return ref;
    }

    function readOne(bytes storage ref, uint256 i) internal view returns (bytes1) {
        return ref[i];
    }

    function pushOne(bytes storage ref, bytes1 value) internal {
        ref.push(value);
    }

    function setOne(bytes storage ref, uint256 i, bytes1 value) internal {
        ref[i] = value;
    }

    function readShortViaParam() public view returns (bytes memory) {
        return readAll(bytes(shortData));
    }

    function readShortViaLocalParam() public view returns (bytes memory) {
        bytes storage ref = bytes(shortData);
        return readAll(ref);
    }

    function readShortAtViaParam(uint256 i) public view returns (bytes1) {
        return readOne(bytes(shortData), i);
    }

    function readShortAtViaLocalParam(uint256 i) public view returns (bytes1) {
        bytes storage ref = bytes(shortData);
        return readOne(ref, i);
    }

    function pushShortViaParam() public {
        pushOne(bytes(shortData), 0xCC);
    }

    function pushShortViaLocalParam() public {
        bytes storage ref = bytes(shortData);
        pushOne(ref, 0xCD);
    }

    function writeShortAtViaParam() public {
        setOne(bytes(shortData), 0, 0xDD);
    }

    function writeShortAtViaLocalParam() public {
        bytes storage ref = bytes(shortData);
        setOne(ref, 1, 0xEE);
    }

    function readDirectShort() public view returns (bytes memory) {
        sbytes memory v = shortData;
        return bytes(v);
    }

    function readLongViaParam() public view returns (bytes memory) {
        return readAll(bytes(longPushData));
    }

    function readLongViaLocalParam() public view returns (bytes memory) {
        bytes storage ref = bytes(longPushData);
        return readAll(ref);
    }

    function pushLongViaParam() public {
        pushOne(bytes(longPushData), 0x21);
    }

    function pushLongViaLocalParam() public {
        bytes storage ref = bytes(longPushData);
        pushOne(ref, 0x22);
    }

    function readDirectLongPush() public view returns (bytes memory) {
        sbytes memory v = longPushData;
        return bytes(v);
    }

    function readLongIndexAtViaParam(uint256 i) public view returns (bytes1) {
        return readOne(bytes(longIndexData), i);
    }

    function readLongIndexAtViaLocalParam(uint256 i) public view returns (bytes1) {
        bytes storage ref = bytes(longIndexData);
        return readOne(ref, i);
    }

    function writeLongIndicesViaParam() public {
        setOne(bytes(longIndexData), 0, 0xAA);
        setOne(bytes(longIndexData), 31, 0xBB);
        setOne(bytes(longIndexData), 32, 0xCC);
    }

    function writeLongIndicesViaLocalParam() public {
        bytes storage ref = bytes(longIndexData);
        setOne(ref, 1, 0xAB);
        setOne(ref, 30, 0xBC);
        setOne(ref, 32, 0xCD);
    }

    function readDirectLongIndex() public view returns (bytes memory) {
        sbytes memory v = longIndexData;
        return bytes(v);
    }
}
// ----
// setup() ->
// readShortViaParam() -> 0x20, 2, left(0xaabb)
// readShortViaLocalParam() -> 0x20, 2, left(0xaabb)
// readShortAtViaParam(uint256): 1 -> left(0xbb)
// readShortAtViaLocalParam(uint256): 0 -> left(0xaa)
// pushShortViaParam() ->
// readDirectShort() -> 0x20, 3, left(0xaabbcc)
// pushShortViaLocalParam() ->
// readDirectShort() -> 0x20, 4, left(0xaabbcccd)
// writeShortAtViaParam() ->
// readDirectShort() -> 0x20, 4, left(0xddbbcccd)
// writeShortAtViaLocalParam() ->
// readDirectShort() -> 0x20, 4, left(0xddeecccd)
// readLongViaParam() -> 0x20, 32, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
// readLongViaLocalParam() -> 0x20, 32, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
// pushLongViaParam() ->
// readDirectLongPush() -> 0x20, 33, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20, left(0x21)
// pushLongViaLocalParam() ->
// readDirectLongPush() -> 0x20, 34, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20, left(0x2122)
// readLongIndexAtViaParam(uint256): 0 -> left(0x01)
// readLongIndexAtViaParam(uint256): 31 -> left(0x20)
// readLongIndexAtViaParam(uint256): 32 -> left(0x21)
// readLongIndexAtViaLocalParam(uint256): 32 -> left(0x21)
// writeLongIndicesViaParam() ->
// readDirectLongIndex() -> 0x20, 33, 0xaa02030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1fbb, left(0xcc)
// writeLongIndicesViaLocalParam() ->
// readDirectLongIndex() -> 0x20, 33, 0xaaab030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1ebcbb, left(0xcd)
