pragma abicoder v2;
// Shielded version of copy_substructures_from_mapping.sol

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

    constructor() {
        suint16[] memory a = new suint16[](2);
        a[0] = suint16(13);
        a[1] = suint16(14);

        m[7] = S({b: "foo", a: a, u: suint16(7)});
    }

    mapping (uint => S) m;
    S s;

    function _toUnshielded(S storage src) internal view returns (SUnshielded memory r) {
        r.b = src.b;
        uint256 len = uint256(src.a.length);
        r.a = new uint16[](len);
        for (uint256 i = 0; i < len; i++) {
            r.a[i] = uint16(src.a[i]);
        }
        r.u = uint16(src.u);
    }

    function to_state() public returns (SUnshielded memory) {
        s.b = m[7].b;
        s.a = m[7].a;
        s.u = m[7].u;
        return _toUnshielded(s);
    }

    function to_storage() public returns (SUnshielded memory) {
        S storage sLocal = s;
        sLocal.b = m[7].b;
        sLocal.a = m[7].a;
        sLocal.u = m[7].u;
        return _toUnshielded(sLocal);
    }

    function to_memory() public returns (SUnshielded memory) {
        S memory sLocal;
        sLocal.b = m[7].b;
        sLocal.a = m[7].a;
        sLocal.u = m[7].u;
        // Copy memory struct to storage so we can convert via _toUnshielded
        s = sLocal;
        return _toUnshielded(s);
    }

}
// ----
// to_state() -> 0x20, 0x60, 0xa0, 7, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
// to_storage() -> 0x20, 0x60, 0xa0, 7, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
// to_memory() -> 0x20, 0x60, 0xa0, 7, 3, 0x666F6F0000000000000000000000000000000000000000000000000000000000, 2, 13, 14
