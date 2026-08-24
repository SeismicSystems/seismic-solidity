// Edge cases around bytes aliases to shielded storage.
// (Passing a shielded alias across an internal-function boundary is rejected at compile time;
// see syntaxTests/.../shielded_alias_internal_param_rejected.sol. Copies stay allowed.)
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
}
// ----
// setup() ->
// readPublic() -> 0x20, 2, left(0x1122)
// copyToPublic() ->
// readPublic() -> 0x20, 2, left(0xaabb)
// appendToPublicAfterCopy() ->
// readPublic() -> 0x20, 3, left(0xaabb33)
