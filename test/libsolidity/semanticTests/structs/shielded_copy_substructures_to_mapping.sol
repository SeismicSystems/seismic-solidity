pragma abicoder v2;
// Shielded version of copy_substructures_to_mapping.sol

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

    function from_memory() public returns (SUnshielded memory) {
        S memory sMemory = s;
        m[0].b = sMemory.b;
        m[0].a = sMemory.a;
        m[0].u = sMemory.u;
        return _toUnshielded(m[0]);
    }

    function from_state() public returns (SUnshielded memory) {
        m[1].b = s.b;
        m[1].a = s.a;
        m[1].u = s.u;
        return _toUnshielded(m[1]);
    }

    function from_storage() public returns (SUnshielded memory) {
        S storage sLocal = s;
        m[1].b = sLocal.b;
        m[1].a = sLocal.a;
        m[1].u = sLocal.u;
        return _toUnshielded(m[1]);
    }

    function from_calldata(S calldata sCalldata) public returns (SUnshielded memory) {
        m[2].b = sCalldata.b;
        m[2].a = sCalldata.a;
        m[2].u = sCalldata.u;
        return _toUnshielded(m[2]);
    }
}
// ----
// from_memory() -> 0x20, 0x60, 0xa0, 0x15, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
// from_state() -> 0x20, 0x60, 0xa0, 21, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
// from_calldata((bytes,suint16[],suint16)): 0x20, 0x60, 0xa0, 21, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14 -> 0x20, 0x60, 0xa0, 0x15, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
