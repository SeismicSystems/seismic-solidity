pragma abicoder v2;

contract C {
    struct S {
        suint8[][] y;
    }

    S data;

    constructor() {
        uint length = 2;
        suint8[] memory d = new suint8[](length);
        d[0] = suint8(3);
        d[1] = suint8(4);

        suint8[][] memory y = new suint8[][](length);
        y[0] = d;
        y[1] = d;

        data = S({y: y});
    }

    struct SUnshielded {
        uint8[][] y;
    }

    function f() public returns (SUnshielded memory) {
        // Convert shielded struct to unshielded for public return.
        // This is all just type conversion gymnastic to be able to get an output that can be checked in the test framework.
        // The actual point of the test is to verify the assignment logic in the constructor above.
        return SUnshielded({y: toUnshielded(data.y)});
    }

    function toUnshielded(suint8[][] memory arr) internal pure returns (uint8[][] memory) {
        uint8[][] memory result = new uint8[][](uint256(arr.length));
        for (uint256 i = 0; i < uint256(arr.length); i++) {
            uint256 innerLen = uint256(arr[i].length);
            result[i] = new uint8[](innerLen);
            for (uint256 j = 0; j < innerLen; j++) {
                result[i][j] = uint8(arr[i][j]);
            }
        }
        return result;
    }
}
// ----
// f() -> 0x20, 0x20, 2, 0x40, 0xa0, 2, 3, 4, 2, 3, 4 # offset to start of S in mem, offset to start of y in mem, length of y, offset to start of y[0] in mem, offset to start of y[1] in mem, values of y[0] and y[1]
// gas irOptimized: 197102
// gas legacy: 199887
// gas legacyOptimized: 196845
