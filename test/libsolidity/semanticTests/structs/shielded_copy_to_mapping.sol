pragma abicoder v2;
// Shielded version of copy_to_mapping.sol

contract C {
    struct S {
        bytes b;
        suint16[] a;
        suint16 u;
    }

    struct SUnshielded {
        bytes b;
        uint16[] a;
        uint16 u;
    }

    S s;
    constructor() {
        suint16[] memory a = new suint16[](2);
        a[0] = suint16(13);
        a[1] = suint16(14);

        s.b = "foo";
        s.a = a;
        s.u = suint16(21);
    }

    mapping (uint => S) m;

    function _toUnshielded(S storage src) internal view returns (SUnshielded memory r) {
        r.b = src.b;
        uint256 len = uint256(src.a.length);
        r.a = new uint16[](len);
        for (uint256 i = 0; i < len; i++) {
            r.a[i] = uint16(src.a[i]);
        }
        r.u = uint16(src.u);
    }

    function from_state() public returns (SUnshielded memory) {
        m[0] = s;
        return _toUnshielded(m[0]);
    }

    function from_storage() public returns (SUnshielded memory) {
        S storage sLocal = s;
        m[1] = sLocal;
        return _toUnshielded(m[1]);
    }

    function from_memory() public returns (SUnshielded memory) {
        S memory sMemory = s;
        m[2] = sMemory;
        return _toUnshielded(m[2]);
    }

    function from_calldata(S calldata sCalldata) public returns (SUnshielded memory) {
        m[3] = sCalldata;
        return _toUnshielded(m[3]);
    }
}
// ----
// from_state() -> 0x20, 0x60, 0xa0, 21, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
// from_storage() -> 0x20, 0x60, 0xa0, 21, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
// from_memory() -> 0x20, 0x60, 0xa0, 21, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
// from_calldata((bytes,suint16[],suint16)): 0x20, 0x60, 0xa0, 21, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14 -> 0x20, 0x60, 0xa0, 21, 3, 0x666f6f0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
