contract C {
    suint256[] x;
    function f() public returns(uint256) {
        x.push(suint(42)); x.push(suint(42)); x.push(suint(42)); x.push(suint(42));
        suint256[] memory y = new suint256[](suint(1));
        y[suint(0)] = suint(23);
        x = y;
        assembly { cstore(x.slot, 4) }
        assert(x[suint(1)] == suint(0));
        assert(x[suint(2)] == suint(0));
        return uint(x[suint(3)]);
    }
}
// ----
// f() -> 0
// gas irOptimized: 108229
// gas legacy: 108216
// gas legacyOptimized: 107625
