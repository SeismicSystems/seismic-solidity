// Shielded version of copy_struct_with_nested_array_from_storage_to_storage.sol

contract C {
    struct S {
        suint8[1] x;
        suint8[] y;
    }

    S src;
    S dst;

    constructor() {
        src.x[0] = suint8(3);
        src.y.push(suint8(7));
        src.y.push(suint8(11));
    }

    function test() public {
        dst = src;

        require(uint8(dst.x[0]) == 3);
        require(uint256(dst.y.length) == 2);
        require(uint8(dst.y[0]) == 7);
        require(uint8(dst.y[1]) == 11);
    }
}
// ----
// test()
