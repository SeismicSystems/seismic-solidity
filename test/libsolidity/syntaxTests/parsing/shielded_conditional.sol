contract TestSbool {
    function f(sbool c) public returns (uint) {
        if (c) {
            return 1;
        } else {
            return 2;
        }
    }

    function g(sbool c) public returns (uint) {
        return c ? 1 : 2;
    }

    function h() public returns (uint) {
        sbool i = sbool(true);
        for (; i; ) {
            return 3;
        }
        return 4;
    }
}

// ----
// Warning 9663: (81-82): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9661: (294-315): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 9663: (332-333): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2018: (25-162): Function state mutability can be restricted to pure
// Warning 2018: (168-243): Function state mutability can be restricted to pure
// Warning 2018: (249-394): Function state mutability can be restricted to pure
