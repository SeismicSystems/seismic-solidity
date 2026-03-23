// Edge cases around bytes aliases to shielded storage.
contract C {
    sbytes private data;
    bytes private publicData;

    function setup() public {
        data.push(sbytes1(0xAA));
        data.push(sbytes1(0xBB));

        publicData.push(0x11);
        publicData.push(0x22);
    }

    function copyToPublic() public {
        publicData = bytes(data);
    }

    function appendToPublicAfterCopy() public {
        publicData = bytes(data);
        publicData.push(0x33);
    }

    function readPublic() public view returns (bytes memory) {
        return publicData;
    }

    function passToInternal() public view returns (bytes memory) {
        bytes storage ref = bytes(data);
        return internalRead(ref);
    }

    function passToInternalDirect() public view returns (bytes memory) {
        return internalRead(bytes(data));
    }

    function internalRead(bytes storage ref) internal view returns (bytes memory) {
        return ref;
    }
}
// ----
// setup() ->
// readPublic() -> 0x20, 2, left(0x1122)
// passToInternal() -> 0x20, 2, left(0xaabb)
// passToInternalDirect() -> 0x20, 2, left(0xaabb)
// copyToPublic() ->
// readPublic() -> 0x20, 2, left(0xaabb)
// appendToPublicAfterCopy() ->
// readPublic() -> 0x20, 3, left(0xaabb33)
