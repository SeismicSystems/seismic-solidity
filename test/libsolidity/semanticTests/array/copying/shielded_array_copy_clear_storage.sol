contract C {
    suint256[] x;
    function f() public returns(suint256) {
        x.push(42); x.push(42); x.push(42); x.push(42);
        suint256[] memory y = new suint256[](1);
        y[0] = 23;
        x = y;
        assembly { cstore(x.slot, 4) }
        assert(x[1] == 0);
        assert(x[2] == 0);
        return x[3];
    }
}
// ----
// f() -> 0
// gas irOptimized: 108229
// gas legacy: 108216
// gas legacyOptimized: 107625
