pragma abicoder v2;

contract C {
    struct S {
        suint8[3] x;
        suint8[][] y;
        suint16 z;
    }

    mapping (suint8 => S) src;
    mapping (suint8 => S) dst;

    constructor() {
        suint8[] memory d = new suint8[](suint(2));
        d[suint8(0)] = suint8(3);
        d[suint8(1)] = suint8(4);

        suint8[][] memory y = new suint8[][](suint(2));
        y[suint8(0)] = d;
        y[suint8(1)] = d;

        src[suint8(0)] = S({x: [suint8(7), suint8(8), suint8(9)], y: y, z: suint16(13)});
    }

    function f() public returns (S memory) {
        dst[suint8(0)] = src[suint8(0)];
        return dst[suint8(0)];
    }
}
// ----
// f() -> 0x20, 7, 8, 9, 0xa0, 13, 2, 0x40, 0xa0, 2, 3, 4, 2, 3, 4
// gas irOptimized: 197102
// gas legacy: 199887
// gas legacyOptimized: 196845
