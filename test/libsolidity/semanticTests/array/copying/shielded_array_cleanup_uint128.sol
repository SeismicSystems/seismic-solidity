// Test to see if cleanup is performed properly during array copying
contract C {
    suint128[] x;
    function f() public returns(bool) {
        x.push(suint128(42)); x.push(suint128(42)); x.push(suint128(42)); x.push(suint128(42));
        suint128[] memory y = new suint128[](1);
        y[0] = suint128(23);
        x = y;
        assembly { sstore(x.slot, 4) }

        assert(bool(x[0] == suint128(23)));
        assert(bool(x[1] == suint128(0)));

        assert(bool(x[2] == suint128(0)));
        assert(bool(x[3] == suint128(0)));

        return true;
    }
}
// ----
// f() -> true
// gas irOptimized: 92740
// gas legacy: 93035
// gas legacyOptimized: 92257
