contract C {
    suint128[] x;
    suint64[] x1;
    suint120[] x2;
    function f() public returns(uint128) {
        x.push(42); x.push(42); x.push(42); x.push(42);
        suint128[] memory y = new suint128[](1);
        y[0] = 23;
        x = y;
        assembly { cstore(x.slot, 4) }
        assert(x[0] == 23);
        assert(x[2] == 0);
        assert(x[3] == 0);
        return uint128(x[1]);
    }

    function g() public returns(uint64) {
        x1.push(42); x1.push(42); x1.push(42); x1.push(42);
        suint64[] memory y = new suint64[](1);
        y[0] = 23;
        x1 = y;
        assembly { cstore(x1.slot, 4) }
        assert(x1[0] == 23);
        assert(x1[2] == 0);
        assert(x1[3] == 0);
        return uint64(x1[1]);
    }

    function h() public returns(uint120) {
        x2.push(42); x2.push(42); x2.push(42); x2.push(42);
        suint120[] memory y = new suint120[](1);
        y[0] = 23;
        x2 = y;
        assembly { cstore(x2.slot, 4) }
        assert(x2[0] == 23);
        assert(x2[2] == 0);
        assert(x2[3] == 0);
        return uint120(x2[1]);
    }
}
// ----
// f() -> 0
// gas irOptimized: 92800
// gas legacy: 93006
// gas legacyOptimized: 92261
// g() -> 0
// h() -> 0
// gas irOptimized: 92862
// gas legacy: 93028
// gas legacyOptimized: 92303
