pragma abicoder v2;

contract C {
    struct S {
        suint8[][] y;
    }

    S data;

    constructor() {
        suint length = suint(2);
        suint8[] memory d = new suint8[](length);
        d[0] = suint8(3);
        d[1] = suint8(4);

        suint8[][] memory y = new suint8[][](length);
        y[0] = d;
        y[1] = d;

        data = S({y: y});
    }

    function f() public returns (S memory) {
        return data;
    }
}
// ----
// f() -> 0x20, 0x20, 2, 0x40, 0xa0, 2, 3, 4, 2, 3, 4 # offset to start of S in mem, offset to start of y in mem, length of y, offset to start of y[0] in mem, offset to start of y[1] in mem, values of y[0] and y[1]
// gas irOptimized: 197102
// gas legacy: 199887
// gas legacyOptimized: 196845
