pragma abicoder v2;
// Shielded version of copy_struct_with_nested_array_from_calldata_to_storage.sol

contract C {
    struct S {
        suint8[1] x;
        suint8[] y;
    }

    S s;

    function test(S calldata src) public {
        s = src;

        require(uint8(s.x[0]) == 3);
        require(uint256(s.y.length) == 2);
        require(uint8(s.y[0]) == 7);
        require(uint8(s.y[1]) == 11);
    }
}
// ----
// test((suint8[1],suint8[])): 0x20, 3, 0x40, 2, 7, 11
