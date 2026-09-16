pragma abicoder v2;

contract C {
    struct S {
        suint8[3] x;
        suint8[][] y;
        suint16 z;
    }

    mapping (uint8 => S) src;
    mapping (uint8 => S) dst;

    constructor() {
        suint8[] memory d = new suint8[](2);
        d[0] = suint8(3);
        d[1] = suint8(4);

        suint8[][] memory y = new suint8[][](2);
        y[0] = d;
        y[1] = d;

        src[0] = S({x: [suint8(7), suint8(8), suint8(9)], y: y, z: suint16(13)});
        dst[0] = src[0];
    }

    struct SUnshielded {
        uint8[3] x;
        uint8[][] y;
        uint16 z;
    }

    function f() public returns (SUnshielded memory) {
        return toUnshielded(dst[0]);
    }

    function toUnshielded(S memory s) internal pure returns (SUnshielded memory) {
        uint8[][] memory y = new uint8[][](uint256(s.y.length));
        for (uint256 i = 0; i < uint256(s.y.length); i++) {
            uint256 innerLen = uint256(s.y[i].length);
            y[i] = new uint8[](innerLen);
            for (uint256 j = 0; j < innerLen; j++) {
                y[i][j] = uint8(s.y[i][j]);
            }
        }
        uint8[3] memory x = [uint8(s.x[0]), uint8(s.x[1]), uint8(s.x[2])];
        return SUnshielded({x: x, y: y, z: uint16(s.z)});
    }
}
// ----
// f() -> 0x20, 7, 8, 9, 0xa0, 13, 2, 0x40, 0xa0, 2, 3, 4, 2, 3, 4
// gas irOptimized: 197102
// gas legacy: 199887
// gas legacyOptimized: 196845
