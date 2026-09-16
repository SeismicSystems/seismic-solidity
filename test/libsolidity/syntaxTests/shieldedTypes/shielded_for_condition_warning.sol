contract TestShieldedForCondition {
    function f(sbool c) public returns (uint) {
        uint i = 0;
        for (; c; ) {
            i++;
            if (i > 10) break;
        }
        return i;
    }

    function g(suint256 a, suint256 b) public returns (uint) {
        uint i = 0;
        for (; a > b; ) {
            i++;
            if (i > 10) break;
        }
        return i;
    }
}

// ----
// Warning 10311: (119-120): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10311: (307-312): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2018: (40-207): Function state mutability can be restricted to pure
// Warning 2018: (213-399): Function state mutability can be restricted to pure
