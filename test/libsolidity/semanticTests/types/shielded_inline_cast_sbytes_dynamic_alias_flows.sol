// Chained aliases and modifier-local aliases must preserve shielded storage ops.
contract C {
    sbytes private data;

    function setup() public {
        data.push(sbytes1(0x10));
        data.push(sbytes1(0x20));
    }

    modifier appendViaAlias(bytes1 value) {
        bytes storage ref = bytes(data);
        ref.push(value);
        _;
    }

    function writeViaModifier() public appendViaAlias(0x30) {}

    function readViaChain() public view returns (bytes memory) {
        bytes storage a = bytes(data);
        bytes storage b = a;
        return b;
    }

    function readViaChainAt(uint256 i) public view returns (bytes1) {
        bytes storage a = bytes(data);
        bytes storage b = a;
        return b[i];
    }

    function pushViaChain() public {
        bytes storage a = bytes(data);
        bytes storage b = a;
        b.push(0x40);
    }

    function writeViaChainAt0() public {
        bytes storage a = bytes(data);
        bytes storage b = a;
        b[0] = 0xAA;
    }

    function readDirect() public view returns (bytes memory) {
        sbytes memory v = data;
        return bytes(v);
    }
}
// ----
// setup() ->
// readViaChain() -> 0x20, 2, left(0x1020)
// readViaChainAt(uint256): 1 -> left(0x20)
// pushViaChain() ->
// readDirect() -> 0x20, 3, left(0x102040)
// writeViaChainAt0() ->
// readDirect() -> 0x20, 3, left(0xaa2040)
// writeViaModifier() ->
// readDirect() -> 0x20, 4, left(0xaa204030)
