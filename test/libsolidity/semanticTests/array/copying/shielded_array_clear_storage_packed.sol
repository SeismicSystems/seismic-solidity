contract C {
    suint128[] x;
    suint64[] x1;
    suint120[] x2;
    function f() public returns(uint128) {
        x.push(suint128(42)); x.push(suint128(42)); x.push(suint128(42)); x.push(suint128(42));
        suint128[] memory y = new suint128[](suint(1));
        y[suint(0)] = suint128(23);
        x = y;
        assembly { cstore(x.slot, 4) }
        assert(x[suint(0)] == suint128(23));
        assert(x[suint(2)] == suint128(0));
        assert(x[suint(3)] == suint128(0));
        return uint128(x[suint(1)]);
    }

    function g() public returns(uint64) {
        x1.push(suint64(42)); x1.push(suint64(42)); x1.push(suint64(42)); x1.push(suint64(42));
        suint64[] memory y = new suint64[](suint(1));
        y[suint64(0)] = suint64(23);
        x1 = y;
        assembly { cstore(x1.slot, 4) }
        assert(x1[suint64(0)] == suint64(23));
        assert(x1[suint64(2)] == suint64(0));
        assert(x1[suint64(3)] == suint64(0));
        return uint64(x1[suint64(1)]);
    }

    function h() public returns(uint120) {
        x2.push(suint120(42)); x2.push(suint120(42)); x2.push(suint120(42)); x2.push(suint120(42));
        suint120[] memory y = new suint120[](suint(1));
        y[suint120(0)] = suint120(23);
        x2 = y;
        assembly { cstore(x2.slot, 4) }
        assert(x2[suint120(0)] == suint120(23));
        assert(x2[suint120(2)] == suint120(0));
        assert(x2[suint120(3)] == suint120(0));
        return uint120(x2[suint120(1)]);
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
