pragma abicoder v2;
// Shielded version of copy_struct_with_nested_array_from_memory_to_memory.sol

contract C {
    struct S {
        suint8[1] x;
        suint8[] y;
    }

    // Cannot return S memory with shielded fields.
    // Original returns default-initialized r, so x[0] = 0, y = empty.
    function test(S memory s) public returns (uint8 x0, uint256 yLen) {
        S memory r;
        x0 = uint8(r.x[0]);
        yLen = uint256(r.y.length);
    }
}
// ----
// test((suint8[1],suint8[])): 0x20, 3, 0x40, 2, 7, 11 -> 0, 0
// test((suint8[1],suint8[])): 0x20, 3, 0x40, 3, 17, 19, 23 -> 0, 0
