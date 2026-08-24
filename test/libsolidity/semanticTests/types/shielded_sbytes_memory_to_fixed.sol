contract C {
    function full() public pure returns (bytes4) {
        bytes memory b = hex"AABBCCDDEE";
        sbytes memory sb = sbytes(b);
        return bytes4(sbytes4(sb));
    }
    function shortInput() public pure returns (bytes4) {
        bytes memory b = hex"AABB";
        sbytes memory sb = sbytes(b);
        return bytes4(sbytes4(sb));
    }
    // must match the public bytes -> bytesN result exactly
    function publicBaseline() public pure returns (bytes4) {
        bytes memory b = hex"AABBCCDDEE";
        return bytes4(b);
    }
    // calldata slice source (ArraySlice path)
    function fromCalldataSlice(sbytes calldata s) external pure returns (bytes4) {
        return bytes4(sbytes4(s[0:4]));
    }
}
// ====
// EVMVersion: >=mercury
// ----
// full() -> 0xAABBCCDD00000000000000000000000000000000000000000000000000000000
// shortInput() -> 0xAABB000000000000000000000000000000000000000000000000000000000000
// publicBaseline() -> 0xAABBCCDD00000000000000000000000000000000000000000000000000000000
// fromCalldataSlice(sbytes): 0x20, 5, 0xAABBCCDDEE000000000000000000000000000000000000000000000000000000 -> 0xAABBCCDD00000000000000000000000000000000000000000000000000000000
