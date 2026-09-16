// bytes aliases to shielded storage must still expose plain bytes metadata types.
contract C {
    sbytes private data;
    bytes private publicData;

    function setup() public {
        data.push(sbytes1(0xAA));
        data.push(sbytes1(0xBB));

        publicData.push(0x11);
    }

    function publicLength() public view returns (uint256) {
        return publicData.length;
    }

    function aliasLength() public view returns (uint256) {
        bytes storage ref = bytes(data);
        return ref.length;
    }
}
// ----
// setup() ->
// publicLength() -> 1
// aliasLength() -> 2
