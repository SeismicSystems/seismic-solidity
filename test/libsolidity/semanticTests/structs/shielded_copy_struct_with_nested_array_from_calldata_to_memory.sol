pragma abicoder v2;
// Shielded version of copy_struct_with_nested_array_from_calldata_to_memory.sol

contract C {
    struct S {
        suint8[1] x;
        suint8[] y;
    }

    // Cannot return S memory with shielded fields, so return individual values.
    function test(S calldata s) public returns (uint8 x0, uint256 yLen, uint8 y0, uint8 y1) {
        S memory m = s;
        x0 = uint8(m.x[0]);
        yLen = uint256(m.y.length);
        y0 = uint8(m.y[0]);
        y1 = uint8(m.y[1]);
    }

    function test2(S calldata s) public returns (uint8 x0, uint256 yLen, uint8 y0, uint8 y1, uint8 y2) {
        S memory m = s;
        x0 = uint8(m.x[0]);
        yLen = uint256(m.y.length);
        y0 = uint8(m.y[0]);
        y1 = uint8(m.y[1]);
        y2 = uint8(m.y[2]);
    }
}
// ----
// test((suint8[1],suint8[])): 0x20, 3, 0x40, 2, 7, 11 -> 3, 2, 7, 11
// test2((suint8[1],suint8[])): 0x20, 3, 0x40, 3, 17, 19, 23 -> 3, 3, 17, 19, 23
