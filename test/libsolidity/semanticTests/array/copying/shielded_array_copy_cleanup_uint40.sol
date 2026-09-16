contract C {
    suint40[] x;
    function f() public returns(bool) {
        // Push 20 elements
        for (uint i = 0; i < 20; i++) {
            x.push(suint40(42));
        }

        // Shrink to 1 element and set it
        while (uint256(x.length) > 1) {
            x.pop();
        }
        x[0] = suint40(23);

        // Force length back to 20 via assembly
        assembly { cstore(x.slot, 20) }

        assert(uint40(x[0]) == 23);
        assert(uint40(x[1]) == 0);
        assert(uint40(x[2]) == 0);
        assert(uint40(x[3]) == 0);
        assert(uint40(x[4]) == 0);
        assert(uint40(x[5]) == 0);
        assert(uint40(x[6]) == 0);
        assert(uint40(x[7]) == 0);
        assert(uint40(x[8]) == 0);
        assert(uint40(x[9]) == 0);
        assert(uint40(x[10]) == 0);
        assert(uint40(x[11]) == 0);
        assert(uint40(x[12]) == 0);
        assert(uint40(x[13]) == 0);
        assert(uint40(x[14]) == 0);
        assert(uint40(x[15]) == 0);
        assert(uint40(x[16]) == 0);
        assert(uint40(x[17]) == 0);
        assert(uint40(x[18]) == 0);
        assert(uint40(x[19]) == 0);
        return true;
    }
}
// ----
// f() -> true
