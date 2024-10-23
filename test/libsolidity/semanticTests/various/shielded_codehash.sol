contract C {
    function f() public returns (bytes32) {
        // non-existent in tests
        return saddress(0).codehash;
    }
    function g() public returns (bytes32) {
        // precompile
        return saddress(0x1).codehash;
    }
    function h() public returns (bool) {
        return saddress(this).codehash != 0;
    }
}
// ====
// EVMVersion: >=constantinople
// ----
// f() -> 0x0
// g() -> 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470
// h() -> true

