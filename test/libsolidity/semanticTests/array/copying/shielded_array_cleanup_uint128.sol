// Test to see if cleanup is performed properly during array copying
contract C {
    suint128[] x;
    function f() public returns(bool) {
        x.push(42); x.push(42); x.push(42); x.push(42);
        suint128[] memory y = new suint128[](1);
        y[0] = 23;
        x = y;
        assembly { cstore(x.slot, 4) }

        assert(x[0] == 23);
        assert(x[1] == 0);

        assert(x[2] == 0);
        assert(x[3] == 0);

        return true;
    }
}
// ----
// f() -> true
// gas irOptimized: 92740
// gas legacy: 93035
// gas legacyOptimized: 92257
