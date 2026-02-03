// Tests ABI encoding of compact shielded storage arrays
// This test exposes a bug where sload was used instead of cload
// in abiEncodingFunctionCompactStorageArray for shielded types
// sbool packs multiple items per slot, triggering the compact array code path
contract C {
    sbool[] flags;

    function setup() public {
        flags.push(sbool(true));
        flags.push(sbool(false));
        flags.push(sbool(true));
        flags.push(sbool(false));
    }

    function getFlags() public view returns (bool[] memory) {
        bool[] memory result = new bool[](flags.length);
        for (uint i = 0; i < flags.length; i++) {
            result[i] = bool(flags[i]);
        }
        return result;
    }

    function getLength() public view returns (uint256) {
        return flags.length;
    }
}
// ----
// getLength() -> 0
// setup() ->
// getLength() -> 4
// getFlags() -> 0x20, 4, true, false, true, false
